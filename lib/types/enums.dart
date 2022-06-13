enum AuthState {
  authenticating,
  notAuthenticated,
  authenticated,
  refreshingToken
}

enum CalendarType { gregorian, shamsi }

enum HttpRequestState { requesting, resolved, rejected }

enum ThemeType { systemDefault, dark, light}