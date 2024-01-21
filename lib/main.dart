import 'package:flutter/material.dart';
import 'model/car.dart';
void main() => runApp(App3());

class App extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int index) {
    return Text(datas[index].name!);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title:const Text('这是我的第二次提交尝试'),
      ),
      // body: MyWidget(),
      body: ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: datas.length,
      ),
    ));
  }
}

class App3 extends StatefulWidget {
  const App3({super.key});

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {
  String buttonName = 'click';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PageName'),
          backgroundColor: const Color.fromARGB(1, 73, 239, 239),
        ),  
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if(buttonName == 'clicked'){
                     buttonName = 'click';
                  } else {
                      buttonName = 'clicked';
                  }
                  
                });
              },
              child: Text(buttonName)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings), 
              label: 'Settings')
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class App2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

// class Home extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold();
//   }
// }

//有状态 和 无状态StatelessWidget
class MyWidget extends StatelessWidget {
  static const str = 'flutterDemo01';
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '你才是一只小猪',
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}

final List<Car> datas = [
  const Car(
    name: '小猪1',
    imageUrl: 'https://baidu.com',
  ),
  const Car(
    name: '小猪2',
    imageUrl: 'https://baidu.com',
  ),
  const Car(
    name: '小猪3',
    imageUrl: 'https://baidu.com',
  ),
  const Car(
    name: '小猪4',
    imageUrl: 'https://baidu.com',
  ),
];
