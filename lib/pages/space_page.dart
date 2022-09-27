import 'package:client/components/organisms/space_list.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/types/space_page_arguments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SpacePage extends StatefulWidget {
  final SpacePageArguments arguments;
  final BuildContext context;

  const SpacePage({Key? key, required this.arguments, required this.context})
      : super(key: key);

  @override
  _SpacePageState createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  late CupertinoTabController _controller;
  late ServiceProvider appService;
  late AppLocalizations t;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CupertinoTabController(initialIndex: 0);
    appService = GetIt.I.get<ServiceProvider>(instanceName: 'appService');
    t = AppLocalizations.of(widget.context)!;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, platform) => Scaffold(
        body: renderTabBody(context, _currentPageIndex),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentPageIndex,
          onTap: (i) => setState(() => _currentPageIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.check_box_outlined),
              title: Text(t.tasks),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.calendar_month_rounded),
              title: Text(t.calendar),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Shanbe.bullseye_1),
              title: Text(t.focus),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.book),
              title: Text(t.notes),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.settings),
              title: Text(t.settings),
              selectedColor: Colors.purple,
            ),
          ],
        ),
      ),
      cupertino: (context, platform) => CupertinoTabScaffold(
        key: widget.key ?? GlobalKey(debugLabel: 'lists'),
        controller: _controller,
        tabBar: CupertinoTabBar(
          height: 54,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.checkmark_square),
                label: t.tasks,
                activeIcon: const Icon(CupertinoIcons.checkmark_square_fill)),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.calendar), label: t.calendar),
            BottomNavigationBarItem(
                icon: const Icon(Shanbe.bullseye_1), label: t.focus),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.book),
                label: t.notes,
                activeIcon: const Icon(CupertinoIcons.book_fill)),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.settings), label: t.settings)
          ],
        ),
        tabBuilder: renderTabBody,
      ),
    );
  }

  Widget renderTabBody(BuildContext context, int index) {
    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          PlatformAppBar(
            title: Text(widget.arguments.space.name),
            cupertino: (context, _) => CupertinoNavigationBarData(
              previousPageTitle: t.spaces,
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: PlatformText(t.newTodo),
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-lists');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}