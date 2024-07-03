import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petfood/screens/loginpage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';
import 'package:petfood/menubar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    final String apiUrl = 'https://petfoodapi.azurewebsites.net/api/users';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String?>{
        'name': _nameController.text,
        'surName': _surnameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 201) {
      // If the server returns a CREATED response
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: const MaterialYou(),
          type: PageTransitionType.bottomToTop,
        ),
      );
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao realizar o cadastro.')),
      );
    }
  }

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
                  child: Lottie.asset('lib/assets/login/catforgot.json'),
                ),
              ),
              const Text(
                'Criar conta',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _nameController,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'Nome',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 104, 60, 10),
                  ),
                ),
              ),
              TextField(
                controller: _surnameController,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'Sobrenome',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 104, 60, 10),
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Color.fromARGB(255, 104, 60, 10),
                  ),
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Senha',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 104, 60, 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: _register,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 193, 157),
                      border: Border.all(
                          color: const Color.fromARGB(255, 207, 152, 90)),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Center(
                    child: Text(
                      'Registrar',
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
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    color: Color.fromARGB(255, 104, 60, 10),
                  )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OU',
                      style: TextStyle(
                        color: Color.fromARGB(255, 104, 60, 10),
                      ),
                    ),
                  ),
                  const Expanded(
                      child: Divider(
                    color: Color.fromARGB(255, 104, 60, 10),
                  )),
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
                      'Entrar com o Google',
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
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                        text: 'Já tem uma conta? ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 60, 10),
                        ),
                      ),
                      const TextSpan(
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
