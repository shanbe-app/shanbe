// ignore_for_file: constant_identifier_names

enum UserAuthState {
  authenticating,
  notAuthenticated,
  authenticated,
  refreshingToken
}

enum HttpRequestState { requesting, resolved, rejected }

enum CalendarType { GREGORIAN, SHAMSI }

enum StartOfTheWeekType { SATURDAY, SUNDAY, MONDAY }

enum ThemeType { DARK, LIGHT, SYSTEM }

enum PriorityType { URGENT, HIGH, NORMAL }

enum ReminderStatus { INITIALIZED, SHOWN, SNOOZED, DONE }

enum StaticTaskListType {
  TODAY,
  TOMORROW,
  DONE,
  TRASH,
  WONTDO,
  ALL,
  NEXT7DAYS,
  OVERDUE
}

enum TaskListFilterLogic { AND, NOT, OR }

enum QueryPredicateLogic { AND, OR }

enum TaskListFilterType { TAGS, TASKLIST, KEYWORD, PRIORITY, DATE }
