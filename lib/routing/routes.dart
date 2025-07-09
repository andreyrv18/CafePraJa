// abstract final class Routes {
//   static const home = '/';
//   static const login = '/login';
//   static const search = '/$searchRelative';
//   static const searchRelative = 'search';
//   static const results = '/$resultsRelative';
//   static const resultsRelative = 'results';
//   static const activities = '/$activitiesRelative';
//   static const activitiesRelative = 'activities';
//   static const booking = '/$bookingRelative';
//   static const bookingRelative = 'booking';
//   static String bookingWithId(int id) => '$booking/$id';
// }

abstract final class Routes {
  static const login = '/login';
  static const initial = '/';
  static const home = '/home';
  static const details = '/details';
  static const detailsComId = '$details/:id';
  static const checkout = '/checkout';
  static const cupons = '/cupons';
  static const perfil = '/perfil';
  static const cadastro = '/cadastro';
  static const notFound = '/404';

  static String detailsWithId(String id) => '$details/$id';
}
