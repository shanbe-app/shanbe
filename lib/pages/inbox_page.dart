import 'package:client/components/atoms/magical_floating_action_button.dart';
import 'package:client/components/atoms/user_avatar.dart';
import 'package:client/components/organisms/space_dialog.dart';
import 'package:client/components/organisms/space_list.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/rx/blocs/space_bloc.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/types/space_page_arguments.dart';
import 'package:client/types/user.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class InboxPage extends StatefulWidget {
  final BuildContext context;

  const InboxPage({Key? key, required this.context}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  late AppLocalizations t;
  late AuthBloc authBloc;
  late SpaceBloc spaceBloc;
  late CupertinoTabController _controller;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc();
    spaceBloc = SpaceBloc();
    t = AppLocalizations.of(widget.context)!;
    _controller = CupertinoTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, platform) => Scaffold(
          key: widget.key ?? GlobalKey(),
          body: renderTabBody(context, _currentPageIndex),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentPageIndex,
            onTap: (i) => setState(() => _currentPageIndex = i),
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Shanbe.bubble_chart),
                title: Text(t.spaces),
                selectedColor: Constants.PRIMARY_COLOR,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.calendar_month_rounded),
                title: Text(t.calendar),
                selectedColor: Colors.green.shade500,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Shanbe.bullseye),
                title: Text(t.focus),
                selectedColor: Colors.pink.shade400,
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/images/notification.svg',
                  color: grayLighterColor(context),
                  width: Constants.ICON_MEDIUM_SIZE,
                  height: Constants.ICON_MEDIUM_SIZE,
                  fit: BoxFit.contain,
                ),
                title: Text(t.reminders),
                selectedColor: Colors.blue.shade700,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: Text(t.settings),
                selectedColor: Colors.grey.shade600,
              ),
            ],
          )),
      cupertino: (context, platform) => CupertinoTabScaffold(
        key: widget.key ?? GlobalKey(),
        controller: _controller,
        tabBar: CupertinoTabBar(
          height: 54,
          onTap: (index) => setState(() => _currentPageIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Shanbe.bubble_chart),
                label: t.spaces,
                activeIcon: const Icon(Shanbe.bubble_chart)),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.calendar), label: t.calendar),
            BottomNavigationBarItem(
                icon: const Icon(Shanbe.bullseye), label: t.focus),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/notification.svg',
                  color: CupertinoColors.inactiveGray,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
                label: t.reminders,
                activeIcon: SvgPicture.asset(
                  'assets/images/notification.svg',
                  color: Constants.PRIMARY_COLOR,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                )),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.settings), label: t.settings)
          ],
        ),
        tabBuilder: renderTabBody,
      ),
    );
  }

  Widget renderTabBody(BuildContext context, int index) {
    return Stack(
      alignment: Alignment.bottomRight,
      fit: StackFit.expand,
      children: [
        CustomScrollView(
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
                      }),
                ],
                leading: StreamBuilder(
                  stream: authBloc.authUser,
                  builder: (context, snapshot) {
                    User? user = snapshot.data as User?;
                    return PlatformIconButton(
                      icon: UserAvatar(
                        avatar: user?.picture,
                        name: user?.name,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                    );
                  },
                ),
              ),
              cupertino: (_, __) => CupertinoSliverNavigationBar(
                largeTitle: Text(
                  t.spaces,
                ),
                stretch: false,
                automaticallyImplyLeading: false,
                previousPageTitle: t.today,
                leading: Row(
                  children: [
                    StreamBuilder(
                      stream: authBloc.authUser,
                      builder: (context, snapshot) {
                        User? user = snapshot.data as User?;
                        return PlatformIconButton(
                          icon: UserAvatar(
                            avatar: user?.picture,
                            name: user?.name,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                        );
                      },
                    ),
                  ],
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: PlatformText(
                    t.edit,
                    style: const TextStyle(
                        fontSize: Constants.S1_FONT_SIZE,
                        fontWeight: Constants.MEDIUM_FONT_WEIGHT),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit-lists');
                  },
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     margin: const EdgeInsets.symmetric(vertical: 16),
            //     padding: Constants.PAGE_PADDING,
            //     child: SearchField(placeholder: t.searchSpacePlaceholder, t: t),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SpaceList(
                      t: t,
                      onPress: (space) {
                        Navigator.of(context).pushNamed('/space',
                            arguments: SpacePageArguments(space: space));
                      },
                    ),
                  )),
            )
            //  Projects
            //  Tags
          ],
        ),
        Positioned(
          child: MagicalFloatingActionButton(onPress: () {
            showPlatformDialog(
                context: context,
                barrierDismissible: true,
                useRootNavigator: true,
                builder: (context) => SpaceDialog(
                      t,
                      onCreate: (Space space) {
                        spaceBloc.createSpace(newSpace: space);
                      },
                    ));
          }),
          right: 16,
          bottom: 100,
        )
      ],
    );
  }
}
