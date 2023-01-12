import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';

class ProvedorPage extends StatefulWidget {
  const ProvedorPage({Key? key}) : super(key: key);

  @override
  State<ProvedorPage> createState() => _ProvedorPageState();
}

class _ProvedorPageState extends State<ProvedorPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                controlsBuilder: (context, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          continued();
                        },
                        child: Text(
                          'AVANÇAR',
                          style: TextStyle(color: context.colors.primary),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          cancel();
                        },
                        child: Text(
                          'VOLTAR',
                          style: TextStyle(color: context.colors.primary),
                        ),
                      ),
                    ],
                  );
                },
                type: stepperType,
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: const Text('Dados Pessoais'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          focusNode: focus,
                          decoration: const InputDecoration(
                            hintText: 'Nome ou Razão Social',
                          ),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Endereço'),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: 'Bairro'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Telefone'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'CNPJ/CPF'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Redes Sociais'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'WhatsApp'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Facebook'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Instagram'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Mais Informações'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Descrição do Serviço ou Produto'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
