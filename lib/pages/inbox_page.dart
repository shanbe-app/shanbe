import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.seventeen_mp_sharp))
      ],
    );
  }
}
