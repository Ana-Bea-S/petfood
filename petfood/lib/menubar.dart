import 'package:flutter/material.dart';
import 'screens/loginpage.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class MaterialYou extends StatefulWidget {
  const MaterialYou({Key? key}) : super(key: key);

  @override
  State<MaterialYou> createState() => _MaterialYouState();
}

class _MaterialYouState extends State<MaterialYou> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    SignIn(),
    Text('video', style: _textStyle),
    Text('home', style: _textStyle),
    Text('sound', style: _textStyle),
    Text('food', style: _textStyle),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PetFood'),
      ),
      backgroundColor: Color.fromARGB(255, 224, 171, 136),
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 1.0,
          bottom: 5.0,
          left: 1.5,
          right: 1.5,
        ), // Defina a quantidade de preenchimento desejada aqui
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), // Raio superior esquerdo
            topRight: Radius.circular(20.0), // Raio superior direito
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorShape: RoundedRectangleBorder(
                // Defina a forma do indicador
                borderRadius:
                    BorderRadius.circular(50), // Raio do indicador retangular
              ),
              indicatorColor:
                  Color.fromARGB(255, 224, 171, 136).withOpacity(0.5),
            ),
            child: NavigationBar(
              backgroundColor: Color.fromARGB(255, 104, 60, 10), // Cor de fundo
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              animationDuration: const Duration(milliseconds: 20),
              height: 55,
              selectedIndex: _currentIndex,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.person_outlined,
                      color: Color.fromARGB(255, 224, 171, 136)),
                  selectedIcon: Icon(Icons.person_outlined,
                      color: Color.fromARGB(255, 104, 60, 10)),
                  label: 'profile',
                ),
                NavigationDestination(
                  icon: Icon(Icons.camera_alt_outlined,
                      color: Color.fromARGB(255, 224, 171, 136)),
                  selectedIcon: Icon(Icons.camera_alt_outlined,
                      color: Color.fromARGB(255, 104, 60, 10)),
                  label: 'video',
                ),
                NavigationDestination(
                  icon: Icon(Icons.home_outlined,
                      color: Color.fromARGB(255, 224, 171, 136)),
                  selectedIcon: Icon(Icons.home_outlined,
                      color: Color.fromARGB(255, 104, 60, 10)),
                  label: 'home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.graphic_eq_outlined,
                      color: Color.fromARGB(255, 224, 171, 136)),
                  selectedIcon: Icon(Icons.graphic_eq_outlined,
                      color: Color.fromARGB(255, 104, 60, 10)),
                  label: 'sound',
                ),
                NavigationDestination(
                  icon: Icon(Icons.egg_alt_outlined,
                      color: Color.fromARGB(255, 224, 171, 136)),
                  selectedIcon: Icon(Icons.egg_alt_outlined,
                      color: Color.fromARGB(255, 104, 60, 10)),
                  label: 'food',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
