import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class EditListsPage extends StatefulWidget {
  const EditListsPage({Key? key}) : super(key: key);

  @override
  State<EditListsPage> createState() => _EditListsPageState();
}

class _EditListsPageState extends State<EditListsPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_, __) => const Scaffold(),
      cupertino: (_, __) => const CupertinoPageScaffold(child: Text('body'),),
    );
  }
}
