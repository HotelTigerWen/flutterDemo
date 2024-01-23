import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// String username = '';
// String userpassword = '';

TextEditingController nameController = TextEditingController();

TextEditingController passwordController = TextEditingController();

bool isInputValid(String input) {
  // 判断输入不为空且不包含特殊字符的逻辑
  if (input.isEmpty) {
    return false; // 输入为空，不合法
  }

  // 定义特殊字符的正则表达式，这里以字母和数字为例，你可以根据需求进行修改
  RegExp specialChars = RegExp(r'[^\w\s]');

  if (specialChars.hasMatch(input)) {
    return false; // 包含特殊字符，不合法
  }

  return true; // 输入合法
}


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class LoginModel {
  String inputName = '';
  String inputPassword = '';

  LoginModel(this.inputName, this.inputPassword);

  void loginAction() {
    bool nameFlag = isInputValid(inputName);
    bool passwordFlag = isInputValid(inputPassword);
    if (nameFlag && passwordFlag) {
      print('我在登录！\n用户名是 $inputName\n密码是 $inputPassword');
    } else {
      // showToast('Hello, Flutter!');
      Fluttertoast.showToast(msg: '错误');
    }
  }
}


class _LoginPageState extends State<LoginPage> {
  // const LoginPage({super.key});
  Widget userNameTf = TextFormField(
    controller: nameController,
    decoration: const InputDecoration(
      icon: Icon(Icons.person),
      hintText: 'please input your username',
      labelText: 'Name *',
    ),
  );

  Widget passWordTf = TextFormField(
    controller: passwordController,
    decoration: const InputDecoration(
      icon: Icon(Icons.key),
      hintText: 'please input youre password',
      labelText: 'PassWord *',
    ),
  );

  Widget imageLogo = Image.network(
      'https://images.unsplash.com/photo-1471115853179-bb1d604434e0?dpr=1&auto=format&fit=crop&w=767&h=583&q=80&cs=tinysrgb&crop=');

  Widget loginBtn = MaterialButton(
    onPressed: () {
      if (nameController.text == '' || passwordController.text == '') {
      } else {
        LoginModel model =
            LoginModel(nameController.text, passwordController.text);
        model.loginAction();
      }
    },
    child: const Text('Login'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LoginPage'),
        ),
        body: Column(
          children: [
            imageLogo,
            userNameTf,
            passWordTf,
            loginBtn,
          ],
        ),
      ),
    );
  }
}
