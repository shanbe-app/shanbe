import 'dart:io';

import 'package:client/components/today_icon.dart';
import 'package:client/pages/settings_page.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/types/inbox_page_arguments.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class InboxPage extends StatefulWidget {
  final BuildContext context;
  final InboxPageArguments? arguments;

  const InboxPage({Key? key, this.arguments, required this.context})
      : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  late CupertinoTabController _controller;
  late AppService appService;
  late AppLocalizations t;

  @override
  void initState() {
    super.initState();
    _controller = CupertinoTabController(initialIndex: 0);
    appService = GetIt.I.get<AppService>(instanceName: 'appService');
    t = AppLocalizations.of(widget.context);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, platform) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.check_box_outlined), label: t.tasks),
            BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_month_rounded),
                label: t.calendar),
            BottomNavigationBarItem(
                icon: const Icon(Shanbe.bullseye_1), label: t.focus),
            BottomNavigationBarItem(
                icon: const Icon(Icons.book), label: t.notes),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: t.settings)
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
    if (true) {
      return SettingsPage(t);
    }
    return CustomScrollView(
      primary: true,
      slivers: [
        PlatformWidget(
          material: (_, __) => SliverAppBar(
            actions: [
              PlatformIconButton(
                  icon: const Icon(Shanbe.sliders_h),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit-lists');
                  })
            ],
          ),
          cupertino: (_, __) => CupertinoSliverNavigationBar(
            largeTitle: PlatformText(t.lists),
            stretch: false,
            automaticallyImplyLeading: true,
            previousPageTitle: t.today,
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: PlatformText(t.edit),
              onPressed: () {
                Navigator.pushNamed(context, '/edit-lists');
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: Constants.PAGE_PADDING,
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: const CupertinoSearchTextField(
              placeholder: 'Search',
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Card(
            margin: Constants.PAGE_PADDING,
            child: Column(
              children: [
                PlatformWidget(
                    material: (_, __) => MaterialButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              TodayIcon(),
                              SizedBox(
                                width: 4,
                              ),
                              PlatformText(t.today)
                            ],
                          ),
                        ),
                    cupertino: (_, __) => CupertinoButton(
                          child: Row(
                            children: [TodayIcon(), PlatformText(t.today)],
                          ),
                          onPressed: () {},
                        )),
                Text('Today'),
                Text('All'),
                Text('Completed'),
                Text('Next 7 Days'),
                Text('Inbox'),
              ],
            ),
          ),
        ),
        //  Projects
        //  Tags
      ],
    );
  }
}
