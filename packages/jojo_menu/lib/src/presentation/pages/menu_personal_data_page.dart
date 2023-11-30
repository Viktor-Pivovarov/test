import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuPersonalDataPage extends StatelessWidget {
  const MenuPersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuAboutCubit, MenuAboutState>(
      builder: (context, state) {
        final url = state.processingOfPersonalData?.link;

        return Scaffold(
          appBar: UiAppBar(
            title: Text(
              MenuI18n.personalDataProcessing,
              style: context.text.mainTitleMedium,
            ),
            backgroundColor: Colors.white,
            useColor: true,
            useShadow: true,
          ),
          body: Column(
            children: [
              if (url != null)
                Expanded(
                  child: InAppWebView(
                    initialSettings: InAppWebViewSettings(
                      transparentBackground: true,
                    ),
                    initialUrlRequest: URLRequest(
                      url: WebUri(url),
                    ),
                  ),
                )
              else
                const UiCircleProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
