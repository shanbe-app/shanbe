import 'package:client/pages/lists_page.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  late PlatformTabController _controller;
  late AppService appService;
  AppLocalizations? t;

  @override
  void initState() {
    super.initState();
    _controller = PlatformTabController(initialIndex: 0);
    appService = GetIt.I.get<AppService>(instanceName: 'appService');
  }

  @override
  Widget build(BuildContext context) {
    t ??= AppLocalizations.of(context);
    return PlatformTabScaffold(
      key: widget.key ?? GlobalKey(debugLabel: 'inbox'),
      iosContentPadding: true,
      appBarBuilder: (context, index) => PlatformAppBar(
        title: PlatformText(t!.today),
        material: (context, target) => MaterialAppBarData(),
        leading: PlatformIconButton(
          material: (context, target) => MaterialIconButtonData(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {}),
          cupertino: (context, target) => CupertinoIconButtonData(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/lists');
              }),
          padding: EdgeInsets.zero,
        ),
      ),
      material: (context, platform) => MaterialTabScaffoldData(
          drawer: Drawer(
        child: Container(
          child: Text('here'),
        ),
      )),
      tabController: _controller,
      bodyBuilder: (context, index) => Container(
        child: Text('body'),
      ),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.seventeen_mp_sharp), label: 'Tasks'),
        BottomNavigationBarItem(
            icon: Icon(Icons.seventeen_mp_sharp), label: 'Calendar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.seventeen_mp_sharp), label: 'Focus'),
        BottomNavigationBarItem(
            icon: Icon(Icons.seventeen_mp_sharp), label: 'Notes'),
        BottomNavigationBarItem(
            icon: Icon(Icons.seventeen_mp_sharp), label: 'Profile')
      ],
    );
  }
}
