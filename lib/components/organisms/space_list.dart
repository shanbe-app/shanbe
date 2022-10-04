import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:client/components/atoms/space_item.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/blocs/space_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpaceList extends StatefulWidget {
  final AppLocalizations t;
  final Function(Space) onPress;

  const SpaceList({Key? key, required this.t, required this.onPress})
      : super(key: key);

  @override
  State<SpaceList> createState() => _SpaceListState();
}

class _SpaceListState extends State<SpaceList> {
  late SpaceBloc spaceBloc;

  @override
  void initState() {
    super.initState();
    spaceBloc = SpaceBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        QuerySnapshot<Space>? querySnapshot =
            snapshot.data as QuerySnapshot<Space>?;
        if (querySnapshot != null) {
          return Column(
            children: [
              ...querySnapshot.items
                  .map((e) => SpaceItem(
                        space: e,
                        onPress: () {
                          widget.onPress(e);
                        },
                      ))
                  .toList()
            ],
          );
        }
        return PlatformCircularProgressIndicator();
      },
      stream: spaceBloc.spaces,
    );
  }
}
