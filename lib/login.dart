import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  Widget userNameTf = TextFormField(
    decoration: const InputDecoration(
      icon: Icon(Icons.person),
      hintText: 'please input your username',
      labelText: 'Name *',
    ),
  );

  Widget passWordTf = TextFormField(
    decoration: const InputDecoration(
      icon: Icon(Icons.key),
      hintText: 'please input youre password',
      labelText: 'PassWord *',
    ),
  );

  Widget imageLogo = Image.network(
      'https://images.unsplash.com/photo-1471115853179-bb1d604434e0?dpr=1&auto=format&fit=crop&w=767&h=583&q=80&cs=tinysrgb&crop=');

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
          ],
        ),
      ),
    );
  }
}
