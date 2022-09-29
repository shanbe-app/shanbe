import 'package:client/models/Space.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SmartSpaceManager {
  late final List<Space> smartSpaces;

  SmartSpaceManager(AppLocalizations t) {
    smartSpaces = [
      Space(name: t.today, emoji: ':star2:'),
      Space(name: t.allSpaces, emoji: ':star2:'),
      Space(name: t.tomorrow, emoji: ':star2:'),
      Space(name: t.nextSevenDays, emoji: ':star2:')
    ];
  }
}
