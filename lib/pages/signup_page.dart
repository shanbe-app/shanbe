import 'package:client/components/signup_intro.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/types/app_intro_data.dart';
import 'package:client/types/signup_intro_data.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignupPage extends StatefulWidget {
  final BuildContext context;

  const SignupPage({Key? key, required this.context}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late AppService appService;
  late AppLocalizations t;
  late List<SignupData> signupData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    t = AppLocalizations.of(context);
    signupData = [
      SignupData(t.appRegisterTitle1, 'assets/files/sync.json', reverse: true),
      SignupData(t.appRegisterTitle2, 'assets/files/notepad.json'),
      SignupData(t.appRegisterTitle3, 'assets/files/notepad.json'),
      SignupData(t.appRegisterTitle4, 'assets/files/yoga3.json')
      SignupData(t.appRegisterTitle5, 'assets/files/yoga3.json')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        cupertino: (_, __) => CupertinoNavigationBarData(
            previousPageTitle: t.settings,
            border: Border.all(width: 0, color: backgroundColor(context)),
            backgroundColor: backgroundColor(context),
        automaticallyImplyMiddle: false,
        ),
        material: (_, __) => MaterialAppBarData(
            elevation: 0, backgroundColor: backgroundColor(context)),
        automaticallyImplyLeading: true,
        title: Text(t.signup),
      ),
      iosContentPadding: true,
      // iosContentBottomPadding: true,
      body: Padding(
        padding: Constants.PAGE_PADDING,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SignupIntro(
              signupData: signupData,
            ),
            PlatformElevatedButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  ClipRRect(
                    child: Image(
                      image: AssetImage(
                        'assets/images/google_light.png',
                      ),
                      height: 36.0,
                    ),
                  ),
                  Text('Sign in with Google')
                ],
              ),
            ),
            SignInButton(
              isDark(context) ? Buttons.GoogleDark : Buttons.Google,
              elevation: 0,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.Facebook,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.Quora,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.Apple,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.Facebook,
              mini: true,
              onPressed: () {},
            ),
            SignInButtonBuilder(
              text: 'Sign in with Email',
              icon: Icons.email,
              onPressed: () {},
              backgroundColor: Colors.blueGrey[700]!,
            )
          ],
        ),
      ),
    );
  }
}
