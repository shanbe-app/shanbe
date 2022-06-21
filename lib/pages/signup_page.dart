import 'package:client/components/signup_intro.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/types/app_intro_data.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SignupPage extends StatefulWidget {
  final BuildContext context;

  const SignupPage({Key? key, required this.context}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late AppService appService;
  late AppLocalizations t;
  late List<AppIntroData> appIntroData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    t = AppLocalizations.of(context);
    appIntroData = [
      AppIntroData(
        t.appRegisterTitle1,
        'assets/files/tasks.json',
        t.appRegisterTitle1,
      ),
      AppIntroData(
          t.appRegisterTitle2, 'assets/files/idea.json', t.appRegisterTitle2),
      AppIntroData(
          t.appRegisterTitle3, 'assets/files/boy.json', t.appRegisterTitle3)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        cupertino: (_, __) =>
            CupertinoNavigationBarData(previousPageTitle: t.settings),
        automaticallyImplyLeading: true,
        title: Text(t.signup),
      ),
      body: Padding(
        padding: Constants.PAGE_PADDING,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SignupIntro(
              appIntroData: appIntroData,
            )
          ],
        ),
      ),
    );
  }
}
