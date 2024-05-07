import 'package:flutter/material.dart';
import 'calendario.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      4,
      (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(255, 245, 217, 199),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 180,
            child: Image.asset(
              'lib/assets/images/image_$index.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 202, 179),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: JumpingDotEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    jumpScale: .7,
                    verticalOffset: 15,
                    activeDotColor: Color.fromARGB(255, 104, 60, 10),
                    dotColor: Color.fromARGB(255, 153, 116, 74),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cuidados',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 104, 60, 10),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          4,
                          (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: DetailPage(),
                                  curve: Curves.linear,
                                  type: PageTransitionType.bottomToTop,
                                  duration: const Duration(milliseconds: 300),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 16),
                              width: 120,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color.fromARGB(255, 215, 158, 120),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Image.asset(
                                        'lib/assets/images/cardimage_$index.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _getCareName(index),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 104, 60, 10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calendário',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 104, 60, 10),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              // Definindo um tamanho fixo para MyAppPage usando um Container
              Container(
                height: 600, // Defina a altura desejada aqui
                child: MyAppPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getCareName(int index) {
    switch (index) {
      case 0:
        return 'Informações';
      case 1:
        return 'Lembretes';
      case 2:
        return 'Remédios';
      case 3:
        return 'Vacinas';
      default:
        return '';
    }
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text('Detail Page Content'),
      ),
    );
  }
}
