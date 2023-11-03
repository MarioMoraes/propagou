import 'package:flutter/material.dart';

import '../controller/provedor_state.dart';

class ProvedoresListPage extends StatefulWidget {
  final ProvedorController provedorController;

  const ProvedoresListPage({super.key, required this.provedorController});

  @override
  State<ProvedoresListPage> createState() => _ProvedoresListPageState();
}

class _ProvedoresListPageState extends State<ProvedoresListPage> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    await widget.provedorController.getProvedores("8", "1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prestadores'),
      ),
      body: Container(),
    );
  }
}
