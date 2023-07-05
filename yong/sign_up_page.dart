import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _confirmPassword;
  bool _wrongConfirmPassword = false;

  void checkPassword() {
    if (_password != _confirmPassword) {
      setState(() {
        _wrongConfirmPassword = true;
      });
    } else {
      setState(() {
        _wrongConfirmPassword = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('회원가입')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: '이메일 주소'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? value) => _email = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: '비밀번호'),
                obscureText: true,
                onChanged: (String? value) => _password = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '비밀번호 확인',
                  errorText: _wrongConfirmPassword ? '비밀번호가 일치하지 않아요' : null,
                ),
                onChanged: (String? value) {
                  _confirmPassword = value;
                  checkPassword();
                },
                obscureText: true,
              ),
              SizedBox(height: 24),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // 회원가입 처리를 추가해주세요(데이터베이스 연동)
                    Navigator.pop(context);
                  }
                },
                child: Text('가입하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

RaisedButton({required Null Function() onPressed, required Text child}) {}
