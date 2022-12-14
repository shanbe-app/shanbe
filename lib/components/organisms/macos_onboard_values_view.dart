import 'package:client/components/atoms/macos_onboard_value_tile.dart';
import 'package:client/types/signup_page_arugments.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:macos_ui/macos_ui.dart';

class MacosOnboardValuesView extends StatelessWidget {
  final AppLocalizations t;

  const MacosOnboardValuesView({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MacosThemeData macosTheme = MacosTheme.of(context);

    return MacosWindow(
      child: MacosScaffold(
        toolBar: ToolBar(
          title: Text(
            t.introduction,
            textAlign: TextAlign.center,
          ),
          // padding: EdgeInsets.only(left: 80),
          leading: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: MacosBackButton(
              fillColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          alignment: Alignment.center,
          centerTitle: true,
          height: Constants.MACOS_TITLE_BAR_HEIGHT,
        ),
        children: [
          ContentArea(
              builder: (context, controller) => Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        padding: Constants.PAGE_PADDING,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            MacosOnboardValueTile(
                                lottiePath: 'assets/files/infinity3.json',
                                title: t.infinitePossibilitiesTitle,
                                fraction: 4,
                                subtitle: t.infinitePossibilitiesDesc),
                            const SizedBox(
                              height: 16,
                            ),
                            MacosOnboardValueTile(
                                lottiePath: 'assets/files/security.json',
                                title: t.securityInMindTitle,
                                fraction: 5,
                                subtitle: t.securityInMindDesc),
                            const SizedBox(
                              height: 16,
                            ),
                            MacosOnboardValueTile(
                                lottiePath: 'assets/files/love-bubble2.json',
                                title: t.loveIngredientTitle,
                                fraction: 4,
                                subtitle: t.loveIngredientDesc)
                          ],
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PushButton(
                                child: Text(
                                  t.back,
                                ),
                                isSecondary: true,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                buttonSize: ButtonSize.small),
                            const SizedBox(
                              width: 16,
                            ),
                            PushButton(
                              alignment: Alignment.center,
                              child: Text(
                                t.letsGo,
                              ),
                              buttonSize: ButtonSize.small,
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup',
                                    arguments: SignupPageArguments(
                                        previousPageTitle: t.introduction));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ))
        ],
      ),
    );
  }
}
