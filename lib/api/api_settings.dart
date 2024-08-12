class ApiSettings {
  static String? id;
  static const apiUrl = 'https://eschool.nawagrow.com/api/student/';
  static const apiProfile = '${apiUrl}profile';

  static const apiAuth = '${apiUrl}auth/';
  static const apiLogin = '${apiAuth}login';
  static const apiLogOut = '${apiAuth}logout';
  static const apiHome = '${apiUrl}home';
  static const apiGetAds = '${apiUrl}ads';
  static const apiPostAds = '${apiUrl}ads';
  static const apiShowAds = '${apiUrl}ads/1';
  static const apiIndexClass = '${apiUrl}class';
  static String apiUpdateAds = '${apiUrl}ads/$id';
  static String apiDeleteAds = '${apiUrl}ads/$id';
}
