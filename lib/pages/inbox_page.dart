import 'package:client/components/atoms/magical_floating_action_button.dart';
import 'package:client/components/atoms/user_avatar.dart';
import 'package:client/components/molecules/macos_sidebar.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/types/user.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:macos_ui/macos_ui.dart';
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
  late CupertinoTabController _controller;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc();
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
                icon: const Icon(Shanbe.checklist),
                title: Text(t.taskLists),
                selectedColor: Constants.PRIMARY_COLOR,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.book),
                title: Text(t.notes),
                selectedColor: Colors.blue.shade700,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Shanbe.bullseye),
                title: Text(t.focus),
                selectedColor: Colors.pink.shade400,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.calendar_month_rounded),
                title: Text(t.calendar),
                selectedColor: Colors.green.shade500,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: Text(t.settings),
                selectedColor: Colors.grey.shade600,
              ),
            ],
          )),
      cupertino: (context, platform) {
        if (platform == PlatformTarget.macOS) {
          return MacosWindow(
            sidebar: macosSidebar(t, context),
            child: const MacosScaffold(
              toolBar: ToolBar(
                title: Text('toolbar'),
              ),
            ),
          );
        }
        return CupertinoTabScaffold(
          key: widget.key ?? GlobalKey(),
          controller: _controller,
          tabBar: CupertinoTabBar(
            height: 54,
            onTap: (index) => setState(() => _currentPageIndex = index),
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Shanbe.checklist),
                  label: t.taskLists,
                  activeIcon: const Icon(Shanbe.checklist)),
              BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.book),
                  label: t.notes,
                  activeIcon: const Icon(CupertinoIcons.book_fill)),
              BottomNavigationBarItem(
                  icon: const Icon(Shanbe.bullseye), label: t.focus),
              BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.calendar), label: t.calendar),
              BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.settings), label: t.settings)
            ],
          ),
          tabBuilder: renderTabBody,
        );
      },
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
                  title: Text(t.taskLists),
                  actions: [
                    PlatformIconButton(
                        icon: const Icon(Shanbe.sliders_h),
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit-lists');
                        }),
                  ],
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
                      SvgPicture.asset(
                        'assets/images/notification.svg',
                        color: Constants.PRIMARY_COLOR,
                        width: 28,
                        height: 28,
                        fit: BoxFit.contain,
                      )
                    ],
                  )),
              cupertino: (_, __) => CupertinoSliverNavigationBar(
                largeTitle: Text(
                  t.taskLists,
                ),
                stretch: false,
                automaticallyImplyLeading: false,
                previousPageTitle: t.today,
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder(
                      stream: authBloc.authUser,
                      builder: (context, snapshot) {
                        User? user = snapshot.data as User?;
                        return PlatformIconButton(
                          icon: UserAvatar(
                            avatar: user?.picture,
                            name: user?.name,
                            size: Constants.ICON_X_LARGE_SIZE,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (user != null) {
                              Navigator.pushNamed(context, '/profile');
                            }
                            Navigator.pushNamed(context, '/settings');
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SvgPicture.asset(
                      'assets/images/notification.svg',
                      color: grayLighterColor(context),
                      width: Constants.ICON_MEDIUM_SIZE,
                      height: Constants.ICON_MEDIUM_SIZE,
                      fit: BoxFit.contain,
                    )
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
                  shape: Constants.CARD_SHAPE,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                builder: (context) => Dialog(
                      child: Text('to be built'),
                    ));
          }),
          right: 16,
          bottom: 100,
        )
      ],
    );
  }
}
