import 'package:flutter/material.dart';
import 'package:petfood/screens/loginpage.dart';
import 'package:petfood/screens/profile/updateprofile.dart';
import 'package:petfood/screens/profile/widgetsprofile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 202, 179),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 60, left: 40, right: 40, top: 80),
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
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => UpdateProfile(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 104, 60, 10),
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Editar Perfil',
                    style: TextStyle(color: Color.fromARGB(255, 246, 193, 157)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(color: Color.fromARGB(255, 104, 60, 10)),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Configurações",
                  icon: Icons.settings_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Meu Pet",
                  icon: Icons.pest_control_rodent_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "aaa",
                  icon: Icons.graphic_eq_outlined,
                  onPress: () {}),
              const Divider(color: Color.fromARGB(255, 104, 60, 10)),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Informações",
                  icon: Icons.person_2_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Sair",
                  icon: Icons.logout_rounded,
                  textColor: const Color.fromARGB(255, 148, 47, 40),
                  endIcon: false,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
