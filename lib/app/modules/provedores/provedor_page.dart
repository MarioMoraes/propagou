import 'package:flutter/material.dart';

class ProvedorPage extends StatefulWidget {
  const ProvedorPage({Key? key}) : super(key: key);

  @override
  State<ProvedorPage> createState() => _ProvedorPageState();
}

class _ProvedorPageState extends State<ProvedorPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
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
                          decoration: const InputDecoration(
                            hintText: 'Nome ou Razão Social',
                          ),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Endereço'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Bairro'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Telefone'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'CNPJ/CPF'),
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
                              const InputDecoration(labelText: 'WhatsApp'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Facebook'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Instagram'),
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
                              labelText: 'Descrição do Serviço ou Produto'),
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
