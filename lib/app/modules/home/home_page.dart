import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
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
