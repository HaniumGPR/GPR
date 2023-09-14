import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:convert'; // for utf8.encode

class BluetoothPage extends StatefulWidget {
  final BluetoothDevice device;

  const BluetoothPage(this.device, {super.key});

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  late BluetoothCharacteristic? characteristic;
  bool isSubscribed = false;
  String receivedData = '';

// 기계 동작 변수
  bool machineOn = false;

  @override
  void initState() {
    super.initState();
    connectToDevice();
  }

  Future<void> connectToDevice() async {
    try {
      await widget.device.connect(autoConnect: false);
      discoverServices();
    } catch (e) {
      print('장치에 연결 실패: $e');
    }
  }

  Future<void> discoverServices() async {
    try {
      List<BluetoothService> services = await widget.device.discoverServices();
      for (var service in services) {
        for (var characteristic in service.characteristics) {
          var characteristicProperty = characteristic.properties;
          if (characteristicProperty.notify) {
            setState(() => this.characteristic = characteristic);
            subscribeToCharacteristic(characteristic);
          }
        }
      }
    } catch (e) {
      print('서비스 검색 실패: $e');
    }
  }

  Future<void> subscribeToCharacteristic(
      BluetoothCharacteristic characteristic) async {
    try {
      await characteristic.setNotifyValue(true);

      setState(() => isSubscribed = true);

      characteristic.value.listen((value) {
        setState(() => receivedData = String.fromCharCodes(value));

        print('Received data :$receivedData');
      });
    } catch (e) {
      print('특성에 대한 알림 실패 :$e');
    }
  }

  Future<void> unsubscribeFromCharacteristic(
      BluetoothCharacteristic characteristic) async {
    try {
      await characteristic.setNotifyValue(false);

      setState(() => isSubscribed = false);
    } catch (e) {
      print('특성에 대한 알림 해제 실패 :$e');
    }
  }

  void disconnectFromDevice() {
    widget.device.disconnect();

    Navigator.pop(context); // 이전 페이지로 돌아가기
  }

// Added sendData function
  Future<void> sendData(String data) async {
    if (characteristic == null) {
      print('특성이 없습니다.');
      return;
    }

    try {
      List<int> bytes = utf8.encode(data);
      await characteristic!.write(bytes);
      print('데이터 전송 성공: $data');
    } catch (e) {
      print('데이터 전송 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bluetooth Page")),
        body: Center(
            child: Column(children: [
          Text("연결된 디바이스 이름 : ${widget.device.name}"),
          ElevatedButton(
              onPressed: () {
// 디바이스로 데이터 전송
                sendData("WELCOME TO RGB");
              },
              child: Text("작업 수행")),
          ElevatedButton(
              onPressed: () {
// 연결해제
                disconnectFromDevice();
              },
              child: Text("연결 해제")),
        ])));
  }
}
