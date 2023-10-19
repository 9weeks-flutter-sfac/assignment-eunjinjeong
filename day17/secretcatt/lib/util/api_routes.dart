//api 주소 정리
class ApiRoutes {
  static const String login =
      'http://52.79.115.43:8090/api/collections/users/auth-with-password';
  static const String signup =
      'http://52.79.115.43:8090/api/collections/users/records';
  static const String secrets =
      'http://52.79.115.43:8090/api/collections/secrets/records?sort=-created';
  static const String users =
      'http://52.79.115.43:8090/api/collections/users/records?sort=-created';
  static const String upload =
      ' http://52.79.115.43:8090/api/collections/secrets/records';
}
