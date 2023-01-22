import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:propagou/app/core/styles/colors_app.dart';
import 'package:propagou/app/core/styles/text_styles.dart';
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/modules/home/controller/home_state.dart';
import 'package:propagou/app/modules/home/widgets/card_tipos.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({Key? key, required this.homeController}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeController.getTipos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 80,
            title: Text('PROPAGOU'),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                SizedBox(
                  height: 8,
                ),
                // HomeFilter(),
                // StickerGroupFilter(countries: countries),
              ],
            ),
          ),
          BlocSelector<HomeController, HomeState, bool>(
            bloc: widget.homeController,
            selector: (state) => state.status == SearchStatus.loading,
            builder: (context, show) {
              return SliverVisibility(
                visible: show,
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .65,
                      child: Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: context.colors.primary,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          BlocSelector<HomeController, HomeState, List<TipoModel>>(
            bloc: widget.homeController,
            selector: (state) => state.listTipos,
            builder: (context, list) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: Text(
                          'Categorias',
                          style:
                              context.textStyles.textPrimaryFontMedium.copyWith(
                            fontSize: 14,
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: list
                                .map((e) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: CardTipos(
                                        id: e.id,
                                        descricao: e.descricao,
                                        icon: e.icon,
                                      ),
                                    ))
                                .toList()),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
