import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/pages/inbox_page.dart';
import 'package:client/pages/intro_page.dart';
import 'package:client/pages/loading_page.dart';
import 'package:client/rx/blocs/settings_bloc.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  final Future<void> appInitFuture;

  const RootPage({Key? key, required this.appInitFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: appInitFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          SettingsBloc bloc =
              SettingsBloc(AppService.getInstance().storageService);
          return StreamBuilder(
            builder: (context, snapshot) {
              bool? isFirstVisit = snapshot.data as bool?;
              if (isFirstVisit == null || isFirstVisit) {
                return IntroPage(
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
        return const LoadingPage();
      },
    );
  }
}
