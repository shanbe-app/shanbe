import 'package:client/models/Space.dart';
import 'package:client/models/Todo.dart';
import 'package:client/types/smart_space.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SmartSpaceManager {
  late final List<SmartSpace> smartSpaces;

  SmartSpaceManager(AppLocalizations t) {
    smartSpaces = [
      SmartSpace(
          query: Todo.RRULE.ne(null),
          space: Space(name: t.today, emoji: ':star:')),
      Space(name: t.allSpaces, emoji: ':star2:'),
      Space(name: t.tomorrow, emoji: ':star2:'),
      Space(name: t.nextSevenDays, emoji: ':star2:')
    ];
  }
}
