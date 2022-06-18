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
        print('done ${snapshot.connectionState == ConnectionState.done}');
        if (snapshot.connectionState == ConnectionState.done) {
          SettingsBloc bloc =
              SettingsBloc(AppService.getInstance().storageService);
          return StreamBuilder(
            builder: (context, snapshot) {
              bool? isFirstVisit = snapshot.data as bool?;
              print('isFirstVisit ${isFirstVisit}');
              if (isFirstVisit == null || isFirstVisit) {
                return IntroPage(
                  context: context,
                );
              }
              return const InboxPage();
            },
            stream: bloc.isFirstVisit,
          );
        }
        return const LoadingPage();
      },
    );
  }
}
