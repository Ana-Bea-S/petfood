import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petfood/menubar.dart';
import 'package:petfood/screens/profile/profilepage.dart';
import 'package:petfood/screens/profile/widgetsprofile.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 202, 179),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 202, 179),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left,
              color: Color.fromARGB(255, 104, 60, 10)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 60, left: 40, right: 40, top: 60),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('lib/assets/images/image_1.jpg'),
                      )),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromARGB(255, 104, 60, 10)),
                        child: const Icon(Icons.add_photo_alternate_outlined,
                            size: 18.0,
                            color: Color.fromARGB(255, 164, 121, 72)),
                      ))
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 104, 60, 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Sobrenome',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 104, 60, 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: Color.fromARGB(255, 104, 60, 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 104, 60, 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MaterialYou(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 104, 60, 10),
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Salvar',
                          style: TextStyle(
                              color: Color.fromARGB(255, 246, 193, 157)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
