import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _idController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: 'ID',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var id = _idController.text;
                        var password = _passwordController.text;
                        print('User entered ID: $id, password: $password');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NextPage()));
                      }
                    },
                    child: Text('로그인'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text('회원가입'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    textStyle: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 회원가입 페이지

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  var _idController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // '뒤로 돌아가기' 버튼의 아이콘을 설정합니다.
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context); // '뒤로 돌아가기' 버튼이 눌리면 이전 페이지로 돌아갑니다.
          },
        ),
        title: Text(
          '회원가입',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _passwordConfirmationController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password Confirmation',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (_passwordController.text != value) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('계정 생성');

                      // 계정 생성 로직 구현
                    }
                  },
                  child: Text('계정 생성'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('Welcome to the next page!'),
      ),
    );
  }
}
