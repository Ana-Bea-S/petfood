// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 224, 171, 136), //Cor de fundo da tela
        child: Padding(
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
                    child: Lottie.asset('lib/assets/cat.json'),
                  ),
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 25.0,
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
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 104, 60, 10)),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color.fromARGB(255, 104, 60, 10)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 61, 35, 6)
                      ), // Define a cor da linha quando o TextField está em foco
                    ),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 104, 60, 10)),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color.fromARGB(255, 104, 60, 10),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 61, 35, 6)
                      ), // Define a cor da linha quando o TextField está em foco
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(
                    // );
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 193, 157),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 207, 152,
                            90), // Defina a cor da borda desejada aqui
                        width: 1, // Defina a largura da borda se necessário
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 60, 10),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //    );
                  },
                  child: Center(
                    child: const Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'Forgot Password? ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 104, 60, 10),
                          ),
                        ),
                        TextSpan(
                          text: 'Reset Here',
                          style: TextStyle(
                            color: Color.fromARGB(255, 104, 60, 10),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 193, 157),
                      border: Border.all(
                          color: const Color.fromARGB(255, 207, 152, 90)),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset('lib/assets/googleicon.png'),
                      ),
                      const Text(
                        'Sign In with Google',
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 60, 10),
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  // onTap: () {
                  // Navigator.pushReplacement(
                  //  context,
                  //  PageTransition(
                  //     child: const SignUp(),
                  //    type: PageTransitionType.bottomToTop));
                  //  },
                  child: const Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'New user? ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 104, 60, 10),
                          ),
                        ),
                        TextSpan(
                          text: 'Register',
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
      ),
    );
  }
}
