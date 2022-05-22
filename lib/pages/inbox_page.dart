import 'package:client/pages/lists_page.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/shanbe_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get_it/get_it.dart';

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
        cupertino: (context, target) => CupertinoNavigationBarData(),
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
                Navigator.pushNamed(context, '/lists');
              }),
          padding: EdgeInsets.zero,
        ),
      ),
      tabController: _controller,
      bodyBuilder: (context, index) => Container(
        child: Text('body'),
      ),
      materialBuilder: (context, platform, index) => MaterialTabScaffoldData(),
      cupertinoBuilder: (context, platform, index) =>
          CupertinoTabScaffoldData(),
      materialTabs: (context, platform) => MaterialNavBarData(items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.check_box_outlined), label: t!.tasks),
        BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month_rounded), label: t!.calendar),
        BottomNavigationBarItem(
            icon: const Icon(Shanbe.bullseye_1), label: t!.focus),
        BottomNavigationBarItem(icon: const Icon(Icons.book), label: t!.notes),
        BottomNavigationBarItem(
            icon: const Icon(Icons.settings), label: t!.settings)
      ]),
      cupertinoTabs: (context, platform) =>
          CupertinoTabBarData(height: 52, items: [
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.checkmark_square),
            label: t!.tasks,
            activeIcon: const Icon(CupertinoIcons.checkmark_square_fill)),
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.calendar), label: t!.calendar),
        BottomNavigationBarItem(
            icon: const Icon(Shanbe.bullseye_1), label: t!.focus),
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.book),
            label: t!.notes,
            activeIcon: const Icon(CupertinoIcons.book_fill)),
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.settings), label: t!.settings)
      ]),
    );
  }
}
