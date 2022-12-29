import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: AssetImage(
                  'assets/images/services.jpg',
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.85),
            child: Center(
              child: SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed('/home');
                  },
                  child: const Text('Entrar'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
