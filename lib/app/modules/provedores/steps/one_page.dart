import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    // Titulo
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: context.colors.background,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Informe Seu Dados',
                          style: TextStyle(
                              fontSize: 18,
                              color: context.colors.primary,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // TextFormField
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _emailEC,
                        decoration: const InputDecoration(
                          isDense: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Nome ou Razão Social',
                        ),
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
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: 'Endereço'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // TextFormField
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _passwordEC,
                        obscureText: true,
                        decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: 'Cidade'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // TextFormField
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _passwordEC,
                        obscureText: true,
                        decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: 'Bairro'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // TextFormField
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _passwordEC,
                        obscureText: true,
                        decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: 'Telefone'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('AVANÇAR'),
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
