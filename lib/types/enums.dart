enum UserAuthState {
  authenticating,
  notAuthenticated,
  authenticated,
  refreshingToken
}

enum HttpRequestState { requesting, resolved, rejected }

enum CalendarType { gregorian, shamsi }

enum StartOfTheWeekType { saturday, sunday, monday }

enum ThemeType { dark, light, system }

enum PriorityType { urgent, high, normal }

enum ReminderStatus { initialized, shown, snoozed, done }

enum StaticTaskListType {
  today,
  tomorrow,
  done,
  trash,
  wontDo,
  all,
  next7days,
  overdue
}

enum TaskListFilterType { tags, taskList, keyword, priority, date }
