import 'package:client/components/organisms/space_list.dart';
import 'package:client/components/today_icon.dart';
import 'package:client/pages/settings_page.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/types/inbox_page_arguments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
    // return SettingsPage(t);
    return CustomScrollView(
      primary: true,
      slivers: [
        PlatformWidget(
          material: (_, __) => SliverAppBar(
            title: Text(t.spaces),
            actions: [
              PlatformIconButton(
                  icon: const Icon(Shanbe.sliders_h),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit-lists');
                  })
            ],
          ),
          cupertino: (_, __) => CupertinoSliverNavigationBar(
            largeTitle: Text(
              t.spaces,
              style: const TextStyle(fontSize: Constants.H1_FONT_SIZE),
            ),
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
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: Constants.PAGE_PADDING,
            child: PlatformWidget(
              cupertino: (_, __) => CupertinoSearchTextField(
                placeholder: t.search,
                style: TextStyle(
                    color: textColor(context),
                    fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                    fontSize: Constants.S1_FONT_SIZE),
                onTap: () {},
                autocorrect: false,
              ),
              material: (_, __) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: inputBackgroundColor(context)),
                child: TextField(
                  expands: false,
                  minLines: null,
                  maxLines: null,
                  style: TextStyle(
                      color: textColor(context),
                      fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                      fontSize: Constants.S1_FONT_SIZE),
                  decoration: InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: appbarBackIconColor(context),
                      size: Constants.ICON_MEDIUM_SIZE,
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 32,
                    ),
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                        color: placeholderColor(context),
                        fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                        fontSize: Constants.S1_FONT_SIZE),
                    hintText: t.search,
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.search,
                  onTap: () {},
                  autocorrect: false,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SpaceList(t: t),
        ),
        //  Projects
        //  Tags
      ],
    );
  }
}
