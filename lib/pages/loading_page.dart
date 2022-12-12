import 'dart:io';
import 'package:client/components/molecules/loading_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:macos_ui/macos_ui.dart';

class LoadingPage extends StatefulWidget {
  final BuildContext context;

  const LoadingPage({Key? key, required this.context}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late AppLocalizations t;

  @override
  void initState() {
    super.initState();
    t = AppLocalizations.of(widget.context)!;
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS) {
      return MacosWindow(
        child: MacosScaffold(
          children: [
            ContentArea(
              minWidth: 256,
              builder: (context, controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [LoadingScaffold(t: t)],
              ),
            )
          ],
        ),
      );
    }
    return PlatformScaffold(
      body: LoadingScaffold(
        t: t,
      ),
    );
  }
}
