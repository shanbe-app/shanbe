import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:client/components/atoms/space_item.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/blocs/space_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpaceList extends StatefulWidget {
  final AppLocalizations t;

  const SpaceList({Key? key, required this.t}) : super(key: key);

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
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: StreamBuilder(
            builder: (context, snapshot) {
              QuerySnapshot<Space>? querySnapshot =
                  snapshot.data as QuerySnapshot<Space>?;
              if (querySnapshot != null) {
                return Column(
                  children: [
                    ...querySnapshot.items
                        .map((e) => SpaceItem(
                              space: e,
                            ))
                        .toList()
                  ],
                );
              }
              return PlatformCircularProgressIndicator();
            },
            stream: spaceBloc.spaces,
          ),
        ));
  }
}
