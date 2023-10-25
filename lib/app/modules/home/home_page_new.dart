import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/core/enums/search_status.dart';
import 'package:propagou/app/core/styles/text_styles.dart';
import 'package:propagou/app/models/tipo_model.dart';

import '../../models/subtipo_model.dart';
import 'controller/home_state.dart';
import 'widgets/card_subtipos.dart';
import 'widgets/card_tipos.dart';

class HomePageNew extends StatefulWidget {
  final HomeController homeController;

  const HomePageNew({super.key, required this.homeController});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
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
        if (state.listSubTipos != [] &&
            state.status == SearchStatus.completed) {
          widget.homeController.changeItem('8');
          filtrarSubTipos('8', state.listSubTipos);
        }
        if (state.status == SearchStatus.filtered) {
          filtrarSubTipos(state.itemSelected, state.listSubTipos);
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            drawer: const Drawer(
              backgroundColor: Colors.blue,
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.menu,
                        color: ColorConstants.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/provedor'),
                          child: const CircleAvatar(
                              child: Icon(Icons.verified_user))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20),
                    child: Text(
                      'PROPAGOU',
                      style: context.textStyles.textPrimaryFontBold.copyWith(
                        fontSize: 22,
                        color: ColorConstants.primary,
                      ),
                    ),
                  ),
                  // List Tipos
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 100, left: 20, right: 20),
                    child: _ListTiposWidget(
                      constraints: constraints,
                      controller: widget.homeController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 210, left: 20),
                    child: Text(
                      'Categorias',
                      style: context.textStyles.textPrimaryFontBold.copyWith(
                        fontSize: 14,
                        color: ColorConstants.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // List SubTipos
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 240, left: 20, right: 20),
                    child: BlocSelector<HomeController, HomeState, bool>(
                      bloc: widget.homeController,
                      selector: (state) =>
                          state.status == SearchStatus.filtered,
                      builder: (context, list) {
                        return _ListSubTiposWidget(
                            subtiposFiltrados: subtiposFiltrados);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ListTiposWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final HomeController controller;

  const _ListTiposWidget({required this.constraints, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeController, HomeState, List<TipoModel>>(
      bloc: controller,
      selector: (state) => state.listTipos,
      builder: (context, list) {
        return SizedBox(
            width: double.infinity,
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: list
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CardTipos(
                        homeController: controller,
                        descricao: e.descricao,
                        icon: e.icon,
                        id: e.id,
                        selected: e.id == controller.itemSelected,
                      ),
                    ),
                  )
                  .toList(),
            ).animate().slideX(
                duration: 500.ms,
                delay: 0.ms,
                begin: 1,
                end: 0,
                curve: Curves.easeInOutSine));
      },
    );
  }
}

class _ListSubTiposWidget extends StatelessWidget {
  final List<SubTipoModel> subtiposFiltrados;

  const _ListSubTiposWidget({
    required this.subtiposFiltrados,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 6.0,
      children: subtiposFiltrados
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CardSubTipos(
                id: e.id,
                descricao: e.grupo,
                icon: '',
              ),
            ),
          )
          .toList(),
    );
  }
}
