import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

DateTime zeroDateTime(DateTime source) {
  return DateTime(source.year, source.month, source.day);
}

DateTime constructDateByPosition(
    String calendar, int passedWeeks, int weekDay) {
  Date date = calendar == 'shamsi' ? Jalali.now() : Gregorian.now();
  return DateTime.now()
      .add(Duration(days: passedWeeks * 7 + weekDay - date.weekDay));
}

DateTime constructDateByIndexFromNow(String calendar, int index) {
  Date date = calendar == 'shamsi' ? Jalali.now() : Gregorian.now();
  return date.addDays(index).toDateTime();
}

String monthDay(String calendar, DateTime d) {
  return calendar == 'shamsi'
      ? Jalali.fromDateTime(d).formatter.d
      : Gregorian.fromDateTime(d).formatter.d;
}

bool isSameDay(DateTime? source, DateTime? destination) {
  if (source != null && destination != null) {
    DateTime sourceZero = zeroDateTime(source);
    DateTime destZero = zeroDateTime(destination);
    return sourceZero.difference(destZero).inDays == 0;
  }
  return false;
}

bool isSameWeek(String calendar, DateTime source, DateTime dest) {
  if (source.difference(dest).inDays > 7) {
    return false;
  }
  Date sourceDate;
  Date destDate;
  if (calendar == 'shamsi') {
    sourceDate = Jalali.fromDateTime(source);
    destDate = Jalali.fromDateTime(dest);
  } else {
    sourceDate = Gregorian.fromDateTime(source);
    destDate = Gregorian.fromDateTime(dest);
  }
  if ((sourceDate.weekDay <= destDate.weekDay &&
          sourceDate.day <= destDate.day) ||
      (sourceDate.weekDay >= destDate.weekDay &&
          sourceDate.day >= destDate.day)) {
    return true;
  }
  return false;
}

bool isAfterDate(DateTime? source, DateTime? destination) {
  if (source == null || destination == null) return false;
  DateTime sourceZero = zeroDateTime(source);
  DateTime destZero = zeroDateTime(destination);
  return sourceZero.difference(destZero).inDays > 0;
}

bool isBeforeDate(DateTime? source, DateTime? destination) {
  if (source == null || destination == null) return false;
  DateTime sourceZero = zeroDateTime(source);
  DateTime destZero = zeroDateTime(destination);
  return sourceZero.difference(destZero).inDays < 0;
}

bool isSameOrBeforeDate(DateTime? source, DateTime? destination) {
  if (source == null || destination == null) return false;
  DateTime sourceZero = zeroDateTime(source);
  DateTime destZero = zeroDateTime(destination);
  return sourceZero.difference(destZero).inDays <= 0;
}

bool isSameOrAfterDate(DateTime? source, DateTime? destination) {
  if (source == null || destination == null) return false;
  DateTime sourceZero = zeroDateTime(source);
  DateTime destZero = zeroDateTime(destination);
  return sourceZero.difference(destZero).inDays >= 0;
}

int passedWeeks(String calendar, DateTime source, DateTime destination) {
  DateTime small =
      source.millisecondsSinceEpoch > destination.millisecondsSinceEpoch
          ? destination
          : source;
  DateTime big = small == source ? destination : source;
  Date dZeroSmall;
  Date dZeroBig;
  if (calendar == 'shamsi') {
    dZeroSmall =
        Jalali.fromGregorian(Gregorian(small.year, small.month, small.day));
    dZeroBig = Jalali.fromGregorian(Gregorian(big.year, big.month, big.day));
  } else {
    dZeroSmall = Gregorian(small.year, small.month, small.day);
    dZeroBig = Gregorian(big.year, big.month, big.day);
  }
  DateTime smallFirstDayOfWeek =
      dZeroSmall.toDateTime().subtract(Duration(days: dZeroSmall.weekDay - 1));
  DateTime bigFirstDayOfWeek =
      dZeroBig.toDateTime().subtract(Duration(days: dZeroBig.weekDay - 1));
  return ((1 + bigFirstDayOfWeek.difference(smallFirstDayOfWeek).inDays) / 7)
      .floor();
}

Date dateFromDateTime(String calendar, DateTime t) {
  return calendar == 'shamsi'
      ? Jalali.fromDateTime(t)
      : Gregorian.fromDateTime(t);
}

int diffInMonth(Date selected, Date source) {
  if (selected.year == source.year) {
    return (selected.month - source.month);
  }
  return (12 * (selected.year - source.year) + (selected.month - source.month));
}

int diffInYear(Date selected, Date source) {
  return source.year - selected.year;
}

int diffInDays(DateTime source, DateTime dest) {
  return zeroDateTime(source).difference(zeroDateTime(dest)).inDays;
}

int diffInMinutes(TimeOfDay source, TimeOfDay dest) {
  return (dest.hour * 60 + dest.minute) - (source.hour * 60 + source.minute);
}

/*
bool hasOccurrence(DateTime source, Todo todo, {String? calendar}) {
  calendar ??= 'shamsi';
  DateTime? dueDate = todo.dueDate?.getDateTime();
  DateTime? endDate = todo.endDate?.getDateTime();
  if (todo.repeatInterval == -1 || todo.repeatType == null || dueDate == null) {
    return false;
  }
  if (isBeforeDate(source, dueDate)) return false;
  if (isAfterDate(source, endDate)) return false;
  if (isSameDay(source, dueDate)) return true;
  DateTime sourceZero = zeroDateTime(source);
  DateTime destZero = zeroDateTime(dueDate);
  Date sourceDate = dateFromDateTime(calendar, sourceZero);
  Date destDate = dateFromDateTime(calendar, destZero);
  switch (todo.repeatType) {
    case RepeatType.DAILY:
      return */
/*!isSameDay(source, todo.dueDate) &&*//*

          diffInDays(source, dueDate) % todo.repeatInterval! == 0;
    case RepeatType.WEEKLY:
      return */
/*!isSameDay(source, todo.dueDate) &&*//*

          diffInDays(source, dueDate) % 7 * todo.repeatInterval! == 0;
    case RepeatType.MONTHLY:
      return diffInMonth(sourceDate, destDate) != 0 &&
          (sourceDate.day == destDate.day) &&
          diffInMonth(sourceDate, destDate) % todo.repeatInterval! == 0;
    case RepeatType.YEARLY:
      return diffInYear(sourceDate, destDate) != 0 &&
          (sourceDate.month == destDate.month &&
              sourceDate.day == destDate.day) &&
          diffInYear(sourceDate, destDate) % todo.repeatInterval! == 0;
    default:
      return false;
  }
}
*/

/*
int repeatCount(String calendar, DateTime source, Todo todo) {
  DateTime? dueDate = todo.dueDate?.getDateTime();
  if (todo.repeatType == null) return -1;
  if (dueDate == null) return -1;
  if (isSameDay(source, dueDate)) return 0;
  if (!hasOccurrence(source, todo, calendar: calendar)) return -1;
  DateTime sourceZero = zeroDateTime(source);
  DateTime destZero = zeroDateTime(dueDate);
  Date sourceDate = dateFromDateTime(calendar, sourceZero);
  Date destDate = dateFromDateTime(calendar, destZero);
  switch (todo.repeatType) {
    case RepeatType.DAILY:
      return sourceZero.difference(destZero).inDays;
    case RepeatType.WEEKLY:
      return sourceZero.difference(destZero).inDays ~/ 7;
    case RepeatType.MONTHLY:
      return diffInMonth(sourceDate, destDate) % todo.repeatInterval!;
    case RepeatType.YEARLY:
      return diffInYear(sourceDate, destDate);
    default:
      return -1;
  }
}
*/

/*
* Date formatting functions
* */
String dMnYYYY(DateTime d, String calendar, [bool withYear = false]) {
  Date date = getDate(calendar, d);
  final formatter = date.formatter;
  return '${formatter.d} ${correctMonthName(formatter.mN, calendar)} ${withYear || includeYear(calendar, d) ? formatter.yyyy : ''}';
}

String dMn(String calendar, DateTime d) {
  Date date = getDate(calendar, d);
  final formatter = date.formatter;
  return '${formatter.d} ${correctMonthName(formatter.mN, calendar)}';
}

String dd(String calendar, DateTime d) {
  Date date = getDate(calendar, d);
  final formatter = date.formatter;
  return formatter.d;
}

String yyyy(String calendar, DateTime d) {
  Date date = getDate(calendar, d);
  final formatter = date.formatter;
  return formatter.yyyy;
}

List<String> _weekDays(String calendar, BuildContext context) {
  AppLocalizations t = AppLocalizations.of(context)!;

  if (calendar == 'shamsi') {
    return [
      t.jWeekDayL1,
      t.jWeekDayL2,
      t.jWeekDayL3,
      t.jWeekDayL4,
      t.jWeekDayL5,
      t.jWeekDayL6,
      t.jWeekDayL7,
    ];
  } else {
    return [
      t.jWeekDayL3,
      t.jWeekDayL4,
      t.jWeekDayL5,
      t.jWeekDayL6,
      t.jWeekDayL7,
      t.jWeekDayL1,
      t.jWeekDayL2,
    ];
  }
}

List<String> _weekDaysWithCalendar(String calendar, String locale) {
  if (calendar == 'shamsi') {
    if (locale == 'fa') {
      return [
        'شنبه',
        'یکشنبه',
        'دوشنبه',
        'سه‌شنبه',
        'چهارشنبه',
        'پنجشنبه',
        'جمعه',
      ];
    }
    return [
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
    ];
  } else {
    if (locale == 'fa') {
      return [
        'دوشنبه',
        'سه‌شنبه',
        'چهارشنبه',
        'پنجشنبه',
        'جمعه',
        'شنبه',
        'یکشنبه',
      ];
    }
    return [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
  }
}

List<String> _weekDaysShort(String calendar, BuildContext context) {
  AppLocalizations t = AppLocalizations.of(context)!;
  if (calendar == 'shamsi') {
    return [
      t.jWeekDay1,
      t.jWeekDay2,
      t.jWeekDay3,
      t.jWeekDay4,
      t.jWeekDay5,
      t.jWeekDay6,
      t.jWeekDay7,
    ];
  } else {
    return [
      t.jWeekDay3,
      t.jWeekDay4,
      t.jWeekDay5,
      t.jWeekDay6,
      t.jWeekDay7,
      t.jWeekDay1,
      t.jWeekDay2,
    ];
  }
}

String weekName(DateTime d, String calendar, BuildContext context) {
  Date date =
      calendar == 'shamsi' ? Jalali.fromDateTime(d) : Gregorian.fromDateTime(d);
  return _weekDays(calendar, context)[date.weekDay - 1];
}

String wdMnMd(DateTime d, BuildContext c, String calendar, String locale) {
  Date date = getDate(calendar, d);
  AppLocalizations t = AppLocalizations.of(c)!;
  final formatter = date.formatter;
  return '${weekName(d, calendar, c)}${t.separator} ${formatter.d} ${correctMonthName(formatter.mN, locale)}';
}
/* WEEK DAYS*/

String mnYYYY(Date d, String locale) {
  final formatter = d.formatter;
  return '${correctMonthName(formatter.mN, locale)} ${formatter.yyyy}';
}

String formatDayRelativelyShort(DateTime d, BuildContext c, String calendar) {
  AppLocalizations localizations = AppLocalizations.of(c)!;
  DateTime now = DateTime.now();
  DateTime nowZero = zeroDateTime(now);
  DateTime thenZero = zeroDateTime(d);
  switch (thenZero.difference(nowZero).inDays) {
    case 1:
      return localizations.tomorrow;
    case 0:
      return localizations.today;
    case -1:
      return localizations.yesterday;
    default:
      return dMn(calendar, d);
  }
}

String formatDayRelatively(DateTime d, BuildContext c, String calendar,
    [bool withYear = false]) {
  AppLocalizations t = AppLocalizations.of(c)!;
  DateTime now = DateTime.now();
  DateTime nowZero = DateTime(now.year, now.month, now.day);
  DateTime thenZero = DateTime(d.year, d.month, d.day);
  String dateFormatted = dMnYYYY(d, calendar, withYear);
  switch (thenZero.difference(nowZero).inDays) {
    case 1:
      return t.tomorrowDayNavigator(dateFormatted);
    case 0:
      return t.todayDayNavigator(dateFormatted);
    case -1:
      return t.yesterdayDayNavigator(dateFormatted);
    default:
      return dateFormatted;
  }
}

String timeAt(TimeOfDay time, BuildContext context) {
  AppLocalizations t = AppLocalizations.of(context)!;
  return t.timeAt('${timeTo2Digit(time.hour)}:${timeTo2Digit(time.minute)}');
}

String formatDateRelativeWithTime(
    DateTime date, TimeOfDay? time, BuildContext context, String calendr) {
  if (time == null) {
    return formatDayRelatively(date, context, calendr);
  }
  return '${formatDayRelatively(date, context, calendr)} ${timeAt(time, context)}';
}

String wnMdMnYyyy(
    DateTime selectedDate, BuildContext c, String calendar, String locale,
    [includeSeparator = true, includeTime = true, withYear = false]) {
  Date date = getDate(calendar, selectedDate);
  DateFormatter formatter = date.formatter;
  AppLocalizations localizations = AppLocalizations.of(c)!;
  String time =
      '${timeTo2Digit(selectedDate.hour)}:${timeTo2Digit(selectedDate.minute)}';
  return '${_weekDays(calendar, c)[date.weekDay - 1]}${includeSeparator ? localizations.separator : ' '}${formatter.d} ${correctMonthName(formatter.mN, locale)} ${withYear || includeYear(calendar, selectedDate) ? formatter.y : ''} ${includeTime ? time : ''}';
}

String upcomingHeaderTitle(
    DateTime selectedDate, BuildContext c, String calendar, String locale) {
  AppLocalizations localizations = AppLocalizations.of(c)!;
  DateTime nowZero = zeroDateTime(DateTime.now());
  DateTime zeroSelectedDate = zeroDateTime(selectedDate);
  switch (zeroSelectedDate.difference(nowZero).inDays) {
    case 0:
      return '${localizations.today} ${localizations.upcomingSeparator} ${wnMdMnYyyy(selectedDate, c, calendar, locale, false, false)}';
    case 1:
      return '${localizations.tomorrow} ${localizations.upcomingSeparator} ${wnMdMnYyyy(selectedDate, c, calendar, locale, false, false)}';
    default:
      return wnMdMnYyyy(selectedDate, c, calendar, locale, false, false);
  }
}

/*
DateFormatter getFormatter(BuildContext context, DateTime date) {
  Store<AppState> store = StoreProvider.of(c);
  String calendar = store.state.calendar;
  Jalali jDate = Jalali.fromDateTime(date);
  Gregorian gDate = Gregorian.fromDateTime(date);
  return calendar == 'shamsi' ? jDate.formatter : gDate.formatter;
}
*/

bool includeYear(String calendar, DateTime date) {
  return calendar == 'shamsi'
      ? Jalali.fromDateTime(date).year !=
          Jalali.fromDateTime(DateTime.now()).year
      : Gregorian.fromDateTime(date).year !=
          Gregorian.fromDateTime(DateTime.now()).year;
}

String correctMonthName(String monthName, String locale) {
  if (locale == 'en') {
    switch (monthName) {
      case 'فروردین':
        return 'Farvardin';
      case 'اردیبهشت':
        return 'Ordibehesht';
      case 'خرداد':
        return 'Khordad';
      case 'تیر':
        return 'Tir';
      case 'مرداد':
        return 'Mordad';
      case 'شهریور':
        return 'Shahrivar';
      case 'مهر':
        return 'Mehr';
      case 'آبان':
        return 'Aban';
      case 'آذر':
        return 'Azar';
      case 'دی':
        return 'Dey';
      case 'بهمن':
        return 'Bahman';
      case 'اسفند':
        return 'Esfand';
      default:
        return monthName;
    }
  }
  if (locale == 'fa') {
    switch (monthName) {
      case 'January':
        return 'ژانویه';
      case 'February':
        return 'فوریه';
      case 'March':
        return 'مارس';
      case 'April':
        return 'آوریل';
      case 'May':
        return 'مه';
      case 'June':
        return 'ژوئن';
      case 'July':
        return 'ژوئیه';
      case 'August':
        return 'اوت';
      case 'September':
        return 'سپتامبر';
      case 'October':
        return 'اکتبر';
      case 'November':
        return 'نوامبر';
      case 'December':
        return 'دسامبر';
      default:
        return monthName;
    }
  }
  return monthName;
}

String correctMonthNameWithLocale(String monthName, String locale) {
  if (locale == 'en') {
    switch (monthName) {
      case 'فروردین':
        return 'Farvardin';
      case 'اردیبهشت':
        return 'Ordibehesht';
      case 'خرداد':
        return 'Khordad';
      case 'تیر':
        return 'Tir';
      case 'مرداد':
        return 'Mordad';
      case 'شهریور':
        return 'Shahrivar';
      case 'مهر':
        return 'Mehr';
      case 'آبان':
        return 'Aban';
      case 'آذر':
        return 'Azar';
      case 'دی':
        return 'Dey';
      case 'بهمن':
        return 'Bahman';
      case 'اسفند':
        return 'Esfand';
      default:
        return monthName;
    }
  }
  if (locale == 'fa') {
    switch (monthName) {
      case 'January':
        return 'ژانویه';
      case 'February':
        return 'فوریه';
      case 'March':
        return 'مارس';
      case 'April':
        return 'آوریل';
      case 'May':
        return 'مه';
      case 'June':
        return 'ژوئن';
      case 'July':
        return 'ژوئیه';
      case 'August':
        return 'اوت';
      case 'September':
        return 'سپتامبر';
      case 'October':
        return 'اکتبر';
      case 'November':
        return 'نوامبر';
      case 'December':
        return 'دسامبر';
      default:
        return monthName;
    }
  }
  return monthName;
}

String wnMdMn(
    DateTime selectedDate, BuildContext c, String calendar, String locale) {
  AppLocalizations t = AppLocalizations.of(c)!;
  Date date = getDate(calendar, selectedDate);
  DateFormatter formatter = date.formatter;
  return '${_weekDays(calendar, c)[date.weekDay - 1]}${t.separator} ${formatter.d} ${(correctMonthName(formatter.mN, locale))}';
}

String wnMdMnWithCalendar(
    DateTime selectedDate, String calendar, String locale) {
  Date date = getDateWithCalendar(selectedDate, calendar);
  DateFormatter formatter = date.formatter;
  return '${_weekDaysWithCalendar(calendar, locale)[date.weekDay - 1]}${locale == 'fa' ? '،' : ','} ${formatter.d} ${(correctMonthNameWithLocale(formatter.mN, locale))}';
}

String greetings(TimeOfDay timeOfDay, BuildContext context, {String? name}) {
  AppLocalizations t = AppLocalizations.of(context)!;
  String greeting = '';
  if (timeOfDay.hour < 5 || timeOfDay.hour >= 21) {
    greeting = t.goodNight;
  }
  if (timeOfDay.hour >= 5 && timeOfDay.hour < 12) {
    greeting = t.goodMorning;
  }
  if (timeOfDay.hour >= 12 && timeOfDay.hour < 16) {
    greeting = t.goodAfternoon;
  }
  if (timeOfDay.hour >= 16 && timeOfDay.hour < 21) {
    greeting = t.goodEvening;
  }
  if (name != null && name.isNotEmpty) {
    greeting += ' $name';
  }
  greeting += '!';
  return greeting;
}

String formatTime(TimeOfDay time) {
  return '${timeTo2Digit(time.hour)}:${timeTo2Digit(time.minute)}';
}

Date getDate(String calendar, DateTime date) {
  Jalali jDate = Jalali.fromDateTime(date);
  Gregorian gDate = Gregorian.fromDateTime(date);
  return calendar == 'shamsi' ? jDate : gDate;
}

Date getDateWithCalendar(DateTime date, String calendar) {
  Jalali jDate = Jalali.fromDateTime(date);
  Gregorian gDate = Gregorian.fromDateTime(date);
  return calendar == 'shamsi' ? jDate : gDate;
}
