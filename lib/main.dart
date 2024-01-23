import 'package:flutter/material.dart';
import 'model/car.dart';
import 'package:flutter_application_1/favorite.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/Enjoy.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentSelectIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _currentSelectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _currentSelectIndex,
          children: [
            HomeScreen(),
            const FavoriteHomePage(),
            EnjoyPage(),
            const SettingsHomePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Enjoy'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          currentIndex: _currentSelectIndex,
          onTap: _changeIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 8.0,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Image(image: NetworkImage(datas[index].imageUrl!)),
      title: Text(datas[index].name!),
      subtitle: Text(datas[index].name!),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(item: datas[index].name!),
          ),
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: datas.length,
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String item;

  DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Center(
        child: Text('Selected Item: $item'),
      ),
    );
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
                if (buttonName == 'clicked') {
                  buttonName = 'click';
                } else {
                  buttonName = 'clicked';
                }
              });
            },
            child: Text(buttonName),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
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

class MyWidget extends StatelessWidget {
  static const str = 'flutterDemo01';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '你才是一只小猪',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}

final List<Car> datas = [
  const Car(
    name: '小猪1',
    imageUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  ),
  const Car(
    name: '小猪2',
    imageUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  ),
  const Car(
    name: '小猪3',
    imageUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  ),
  const Car(
    name: '小猪4',
    imageUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  ),
];
