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
        List<Space>? items = snapshot.data as List<Space>?;
        if (items != null) {
          return Column(
            children: items
                .map((e) => SpaceItem(
                      space: e,
                      t: widget.t,
                      onPress: () {
                        widget.onPress(e);
                      },
                    ))
                .toList(),
          );
        }
        return PlatformCircularProgressIndicator();
      },
      stream: spaceBloc.spaces,
    );
  }
}
