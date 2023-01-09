import 'package:flutter/material.dart';
import 'package:propagou/app/modules/home/controller/home_state.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;
  const HomePage({Key? key, required this.homeController}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeController.getTipos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 150,
            title: Text('PROPAGOU'),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                // StickerStatusFilter(filterSelected: filterSelected),
                // StickerGroupFilter(countries: countries),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
