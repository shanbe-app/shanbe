import 'dart:developer';

import 'package:client/models/WorkSpace.dart';
import 'package:client/pages/onboard_page.dart';
import 'package:client/pages/loading_page.dart';
import 'package:client/pages/inbox_page.dart';
import 'package:client/rx/blocs/model_bloc.dart';
import 'package:client/rx/blocs/settings_bloc.dart';
import 'package:client/rx/service_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  final Future<void> appInitFuture;

  const InitPage({Key? key, required this.appInitFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: appInitFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          ModelBloc<WorkSpace> workspaceBloc = ModelBloc(
              ServiceProvider.getInstance().firebaseService, 'workspaces');
          return StreamBuilder(
            builder: (context, snapshot) {
              QuerySnapshot? workspaces = snapshot.data as QuerySnapshot?;
              print(workspaces?.docs);
              if (workspaces == null) {
                return LoadingPage(context: context);
              }
              if (workspaces.docs.isEmpty) {
                return OnBoardPage(
                  context: context,
                );
              }
              return InboxPage(
                context: context,
              );
            },
            stream: workspaceBloc.allModels,
          );
        }
        return LoadingPage(context: context);
      },
    );
  }
}
