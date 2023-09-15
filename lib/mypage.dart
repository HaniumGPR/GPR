import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            FlutterBluePlus flutterblue = FlutterBluePlus();

            // startScan() 메서드를 사용하여 스캔 시작
            await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

            // scanResults 프로퍼티를 사용하여 스캔 결과 받기
            FlutterBluePlus.scanResults.listen((List<ScanResult> results) {
              for (ScanResult result in results) {
                // scanResult.device provides the BluetoothDevice object.
                BluetoothDevice device = result.device;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BluetoothPage(device: device)),
                );

                // stop scanning
                FlutterBluePlus.stopScan();
              }
            }, onError: (error) {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('장치를 찾을 수 없음'),
                  content: const Text('주변에 블루투스 장치가 없습니다.'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('확인'),
                    ),
                  ],
                ),
              );

              // stop scanning
              FlutterBluePlus.stopScan();
            });
          },
          child: const Text('BlueTooth 연결'),
        ),
      ),
    );
  }
}

class BluetoothPage extends StatelessWidget {
  final BluetoothDevice device;

  const BluetoothPage({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Bluetooth Page")),
        body: Center(
            child: Column(children: [
          const Text("연결된 디바이스 이름"),
          ElevatedButton(
              onPressed: () async {
// 데이터 송수신 등의 작업 수행

                await device.disconnect(); // 작업 완료 후 연결 해제

                if (!context.mounted) return;

                Navigator.pop(context); // 이전 페이지로 돌아가기
              },
              child: const Text("작업 수행"))
        ])));
  }
}
