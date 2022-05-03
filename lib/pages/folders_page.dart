import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FoldersPage extends StatefulWidget {
  const FoldersPage({Key? key}) : super(key: key);

  @override
  _FoldersPageState createState() => _FoldersPageState();
}

class _FoldersPageState extends State<FoldersPage> {
  AppLocalizations? t;

  @override
  Widget build(BuildContext context) {
    t ??= AppLocalizations.of(context);
    return PlatformScaffold(
      key: widget.key ?? GlobalKey(debugLabel: 'folders'),
      iosContentPadding: false,
      iosContentBottomPadding: false,
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: PlatformText(t!.folders),
      ),
      body: SafeArea(
        child: Container(
        ),
      ),
    );
  }
}
