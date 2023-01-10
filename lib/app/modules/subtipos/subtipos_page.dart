import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:propagou/app/core/styles/colors_app.dart';
import 'package:propagou/app/core/styles/text_styles.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/modules/subtipos/controller/subtipos_state.dart';
import 'package:propagou/app/modules/subtipos/widgets/card_subtipo.dart';

class SubtiposPage extends StatefulWidget {
  final SubTiposController subTiposController;
  final Map<String, dynamic> args;

  const SubtiposPage({
    Key? key,
    required this.subTiposController,
    required this.args,
  }) : super(key: key);

  @override
  State<SubtiposPage> createState() => _SubtiposPageState();
}

class _SubtiposPageState extends State<SubtiposPage> {
  @override
  void initState() {
    super.initState();
    widget.subTiposController.getSubTipos(widget.args['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            centerTitle: true,
            title: Text(
              widget.args['descricao'].toUpperCase(),
              style: context.textStyles.textPrimaryExtraBold
                  .copyWith(color: context.colors.secondary, fontSize: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                // StickerStatusFilter(filterSelected: filterSelected),
                // StickerGroupFilter(countries: countries),
              ],
            ),
          ),
          BlocSelector<SubTiposController, SubTipoState, bool>(
            bloc: widget.subTiposController,
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
          BlocSelector<SubTiposController, SubTipoState, List<SubTipoModel>>(
              bloc: widget.subTiposController,
              selector: (state) => state.listSubTipos,
              builder: (context, list) {
                return SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      list
                          .map(
                            (e) => CardSubtipo(
                              descricao: e.descricao,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
