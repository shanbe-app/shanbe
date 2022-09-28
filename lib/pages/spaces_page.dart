import 'package:client/components/atoms/magical_floating_action_button.dart';
import 'package:client/components/atoms/profile_avatar.dart';
import 'package:client/components/atoms/search_field.dart';
import 'package:client/components/atoms/user_avatar.dart';
import 'package:client/components/molecules/space_dialog.dart';
import 'package:client/components/organisms/space_list.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/rx/blocs/space_bloc.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/types/user.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpacesPage extends StatefulWidget {
  final BuildContext context;

  const SpacesPage({Key? key, required this.context}) : super(key: key);

  @override
  _SpacesPageState createState() => _SpacesPageState();
}

class _SpacesPageState extends State<SpacesPage> {
  late AppLocalizations t;
  late AuthBloc authBloc;
  late SpaceBloc spaceBloc;

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc();
    spaceBloc = SpaceBloc();
    t = AppLocalizations.of(widget.context)!;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, platform) => Scaffold(
        body: renderTabBody(context),
      ),
      cupertino: (context, platform) => CupertinoPageScaffold(
        key: widget.key ?? GlobalKey(debugLabel: 'lists'),
        child: renderTabBody(context),
      ),
    );
  }

  Widget renderTabBody(BuildContext context) {
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
                      })
                ],
              ),
              cupertino: (_, __) => CupertinoSliverNavigationBar(
                largeTitle: Text(
                  t.spaces,
                ),
                stretch: false,
                automaticallyImplyLeading: true,
                previousPageTitle: t.today,
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
                    if (user != null) {
                      return UserAvatar(
                          avatar: user.picture,
                          name: user.name,
                          isOnline: true);
                    }
                    return UserAvatar(
                      avatar: null,
                      name: 'S',
                    );
                  },
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
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: Constants.PAGE_PADDING,
                child: SearchField(placeholder: t.searchSpacePlaceholder, t: t),
              ),
            ),
            SliverToBoxAdapter(
              child: SpaceList(t: t),
            ),
            //  Projects
            //  Tags
          ],
        ),
        Positioned(
          child: MagicalFloatingActionButton(onPress: () {
            showPlatformDialog(
                context: context,
                builder: (context) => SpaceDialog(t, onCreate: (Space space) {
                      spaceBloc.createSpace(newSpace: space);
                    }, onUpdate: (Space space) {}));
          }),
          right: 16,
          bottom: 32,
        )
      ],
    );
  }
}
