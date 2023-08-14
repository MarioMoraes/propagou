import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:propagou/app/core/styles/colors_app.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/modules/home/controller/home_state.dart';
import 'package:propagou/app/modules/home/widgets/card_tipos.dart';

import '../../core/enums/search_status.dart';
import '../../models/tipos_model.dart';
import 'widgets/card_subtipos.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({Key? key, required this.homeController}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedTipoId = '1';
  List<SubTipoModel> subtiposFiltrados = [];

  void filtrarSubTipos(String tipoId, List<SubTipoModel> subtipos) {
    setState(() {
      selectedTipoId = tipoId;
      subtiposFiltrados = subtipos
          .where((element) => element.grupoId == selectedTipoId)
          .toList();
    });
  }

  @override
  void initState() {
    _fetchAll();
    super.initState();
  }

  Future<void> _fetchAll() async {
    await widget.homeController.getTipos();
    await widget.homeController.getSubTipos();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: widget.homeController,
      listener: (context, state) {
        if (state.status == SearchStatus.completed) {
          filtrarSubTipos('8', state.listSubTipos);
        }
        if (state.status == SearchStatus.filtered) {
          filtrarSubTipos(state.itemSelected, state.listSubTipos);
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.background,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 80,
              title: Text('PROPAGOU'),
            ),
            const SliverToBoxAdapter(
              child: Column(
                children: [],
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

            // Lista de Tipos (Horizontal)
            BlocSelector<HomeController, HomeState, List<TiposModel>>(
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
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: list
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CardTipos(
                                      homeController: widget.homeController,
                                      id: e.id,
                                      descricao: e.descricao,
                                      icon: '',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Lista de SubTipos (Horizontal)
            BlocSelector<HomeController, HomeState, List<SubTipoModel>>(
              bloc: widget.homeController,
              selector: (state) => subtiposFiltrados,
              builder: (context, list) {
                var idSelected = widget.homeController.itemSelected;
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Wrap(
                              spacing: 1.0,
                              runSpacing: 4.0,
                              children: list
                                  .where((element) =>
                                      element.grupoId == idSelected)
                                  .map(
                                    (e) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: CardSubTipos(
                                          id: e.id,
                                          descricao: e.grupo,
                                          icon: ''),
                                    ),
                                  )
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
      ),
    );
  }
}
