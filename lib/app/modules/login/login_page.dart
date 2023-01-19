import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner.webp'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      // Espacamento Dependendo do Tamanho do Device
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            (MediaQuery.of(context).size.width > 350
                                ? .25
                                : .25),
                      ),

                      // Titulo
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Center(
                          child: Text(
                            'LOGIN',
                          ),
                        ),
                      ),

                      // TextFormField
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          controller: _emailEC,
                          decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: Text('Email')),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // TextFormField
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          controller: _passwordEC,
                          obscureText: true,
                          decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: Text('Senha')),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // Text
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Esqueceu sua senha?',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Button LOGIN
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(),
                      ),
                    ],
                  ),
                ),

                // Mensagem Rodape
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text.rich(
                          TextSpan(
                            text: 'Não possui uma conta? ',
                            children: [
                              TextSpan(
                                text: 'Cadastre-se',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context)
                                      .pushNamed('/auth/register'),
                              ),
                            ],
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
      ),
    );
  }
}
