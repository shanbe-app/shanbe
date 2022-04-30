import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  late PlatformTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PlatformTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      appBarBuilder: (context, index) =>
          PlatformAppBar(title: Text('App bar'),),
      tabController: _controller,
      bodyBuilder: (context,index)=> Container(child: Text('body'),),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.seventeen_mp_sharp),label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.seventeen_mp_sharp), label: 'Settings')
      ],
    );
  }
}
