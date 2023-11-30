import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuBlacklistPage extends StatefulWidget {
  const MenuBlacklistPage({super.key});

  @override
  State<MenuBlacklistPage> createState() => _MenuBlacklistPageState();
}

class _MenuBlacklistPageState extends State<MenuBlacklistPage> {
  @override
  void initState() {
    super.initState();
    context.read<MenuBlacklistCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        useColor: true,
        title: Text(MenuI18n.blacklist),
      ),
      body: BlocBuilder<MenuBlacklistCubit, MenuBlacklistState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.only(
              left: Insets.l,
              right: Insets.l,
              top: Insets.xxl,
              bottom: Insets.bottomNavBar,
            ),
            itemCount: state.candidates.length,
            itemBuilder: (context, index) {
              return UiCard(
                padding: const EdgeInsets.only(
                  left: Insets.m,
                  top: Insets.m,
                  right: Insets.m,
                  bottom: Insets.s,
                ),
                titleWidget: Row(
                  children: [
                    CacheImage(
                      radius: Insets.xl,
                      width: 48,
                      height: 48,
                      url: state.candidates[index].photo,
                    ),
                    const SizedBox(
                      width: Insets.s,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${MenuI18n.age} ${state.candidates[index].age}',
                          style: context.text.mainTextMedium.copyWith(
                            height: 16 / 12,
                            fontSize: 12,
                            color: context.color.smallTextColor,
                          ),
                        ),
                        Text(
                          state.candidates[index].firstName,
                          style: context.text.mainTitle,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    UiButton.text(
                      padding: EdgeInsets.zero,
                      fullWidth: false,
                      text: MenuI18n.unblock,
                      onPressed: () => context
                          .read<MenuBlacklistCubit>()
                          .onPressedUnblock(state.candidates[index]),
                      textStyle: context.text.smallTitle.copyWith(
                        fontSize: 14,
                        color: context.color.mainAccentColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
