import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:propagou/app/core/widgets/animated_app_bar_widget.dart';
import 'package:propagou/app/models/provedor_model.dart';
import 'package:propagou/app/modules/provedores/list/widgets/card_provedor.dart';

import '../../../core/constants/color_constants.dart';
import '../controller/provedor_state.dart';

class ProvedoresListPage extends StatefulWidget {
  final ProvedorController provedorController;
  final Map classificacao;

  const ProvedoresListPage({
    super.key,
    required this.provedorController,
    required this.classificacao,
  });

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
    await widget.provedorController.getProvedores(widget.classificacao['id']);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProvedorController, ProvedorState>(
      bloc: widget.provedorController,
      listener: (context, state) {
        if (state.provedores.isEmpty) {
          const SnackBar(content: Text('No Selected'));
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 80,
              centerTitle: true,
              title: AnimatedAppBarWidget(
                name: widget.classificacao['descricao'],
                appBarPlayTime: 500.ms,
                appBarDelayTime: 500.ms,
              ),
            ),
            BlocSelector<ProvedorController, ProvedorState, bool>(
              bloc: widget.provedorController,
              selector: (state) => state.status == ProvedorStatus.loading,
              builder: (context, showLoading) {
                return SliverVisibility(
                  visible: showLoading,
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * .60,
                      child: Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: ColorConstants.primary,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocSelector<ProvedorController, ProvedorState,
                    List<ProvedorModel>>(
                bloc: widget.provedorController,
                selector: (state) => state.provedores,
                builder: (context, list) {
                  return SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        list
                            .map((e) => CardProvedor(provedorModel: e))
                            .toList()
                            .animate(interval: 100.ms, delay: 300.ms)
                            .slideX(
                                duration: 300.ms,
                                begin: 3,
                                end: 0,
                                curve: Curves.easeInOutSine),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
