import 'dart:io';

import 'package:client/rx/services/app_service.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key? key}) : super(key: key);

  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  late CupertinoTabController _controller;
  late AppService appService;
  AppLocalizations? t;

  @override
  void initState() {
    super.initState();
    _controller = CupertinoTabController(initialIndex: 0);
    appService = GetIt.I.get<AppService>(instanceName: 'appService');
  }

  @override
  Widget build(BuildContext context) {
    t ??= AppLocalizations.of(context);
    return PlatformWidget(
      material: (context, platform) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [],
        ),
      ),
      cupertino: (context, platform) => CupertinoTabScaffold(
        key: widget.key ?? GlobalKey(debugLabel: 'lists'),
        controller: _controller,
        tabBar: CupertinoTabBar(
          items: [
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
          ],
        ),
        tabBuilder: (context, index) => CustomScrollView(
          primary: true,
          slivers: [
            // SliverAppBar(
            //   actions: [
            //     ElevatedButton(child: Text('edit'),onPressed: ,)
            //   ],
            //   title: Text('Lists'),
            //
            // ),
            CupertinoSliverNavigationBar(
              largeTitle: PlatformText(t!.lists),
              stretch: false,
              automaticallyImplyLeading: true,
              previousPageTitle: t!.today,
              trailing: PlatformIconButton(
                icon: const Icon(Shanbe.sliders_h),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-lists');
                },
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
                                  Icon(Icons.today,),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  PlatformText(t!.today)
                                ],
                              ),
                            ),
                        cupertino: (_, __) => CupertinoButton(
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  PlatformText(t!.today)
                                ],
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
        ),
      ),
    );
  }
}
