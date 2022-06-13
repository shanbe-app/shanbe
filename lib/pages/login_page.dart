import 'package:client/components/app_intro.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/types/app_intro_Data.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AppService appService;
  AppLocalizations? t;

  @override
  Widget build(BuildContext context) {
    t ??= AppLocalizations.of(context);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        cupertino: (_, __) =>
            CupertinoNavigationBarData(previousPageTitle: t!.settings),
        title: const Text('Login'),
      ),
      body: Padding(
        padding: Constants.PAGE_PADDING,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppIntro(appIntroData: [
                AppIntroData(t!.appRegisterTitle1, t!.appRegisterTitle1, 'assets/files/tasks.json'),
                AppIntroData(t!.appRegisterTitle2, t!.appRegisterTitle2, 'assets/files/idea.json'),
                AppIntroData(t!.appRegisterTitle3, t!.appRegisterTitle3, 'assets/files/boy.json')
              ],),
            )
          ],
        ),
      ),
    );
  }
}
