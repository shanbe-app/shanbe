import 'package:client/pages/inbox_page.dart';
import 'package:client/pages/loading_page.dart';
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
          return const InboxPage();
        }
        return const LoadingPage();
      },
    );
  }
}
