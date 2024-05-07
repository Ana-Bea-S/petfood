import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petfood/screens/loginpage.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 171, 136),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 230, // Defina a largura desejada
                  height: 230, // Defina a altura desejada
                  child: Lottie.asset('lib/assets/login/dogforgot.json'),
                ),
              ),
              const Text(
                'Esqueci a senha',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Color.fromARGB(255, 104, 60, 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20, 
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 193, 157),
                      border: Border.all(
                          color: const Color.fromARGB(255, 207, 152, 90)),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: const Center(
                    child: Text(
                      'Resetar senha',
                      style: TextStyle(
                        color: Color.fromARGB(255, 104, 60, 10),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: const SignIn(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Já tem uma conta? ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 60, 10),
                        ),
                      ),
                      TextSpan(
                        text: 'Entrar',
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 60, 10),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
