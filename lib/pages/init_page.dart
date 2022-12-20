import 'package:client/pages/onboard_page.dart';
import 'package:client/pages/loading_page.dart';
import 'package:client/pages/inbox_page.dart';
import 'package:client/rx/blocs/settings_bloc.dart';
import 'package:client/rx/service_provider.dart';
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
          SettingsBloc bloc =
              SettingsBloc(ServiceProvider.getInstance().storageService);
          return StreamBuilder(
            builder: (context, snapshot) {
              bool? isFirstVisit = snapshot.data as bool?;
              if (true) {
                return LoadingPage(context: context);
              }
              if (false) {
                return OnBoardPage(
                  context: context,
                );
              }
              return InboxPage(
                context: context,
              );
            },
            stream: bloc.isFirstVisit,
          );
        }
        return LoadingPage(context: context);
      },
    );
  }
}
