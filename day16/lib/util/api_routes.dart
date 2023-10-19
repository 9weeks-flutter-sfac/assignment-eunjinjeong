//<ApiRoutes만 따로 class로 관리하기 (자동완성으로 많은 페이지를 깔끔하게 관리하기 위함)

class ApiRoutes {
  // static으로 언제든지 불러와서 쓸 수 있도록 (정적인 데이터 보관))
  static const String authWithPassword =
      '/api/collections/users/auth-with-password'; //로그인url
}
