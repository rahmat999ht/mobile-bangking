// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return DASHBOARD;
  }

  static const DASHBOARD = '/dashboard';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';
  static const REQUEST = '/request';
  static const SEND = '/send';
  static const ADD_NEW_DELIVERY = '/add-new-delivery';
}
