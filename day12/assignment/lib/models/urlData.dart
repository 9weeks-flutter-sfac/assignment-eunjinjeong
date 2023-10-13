class UrlData {
  String name;
  String description;
  String image;
  int price;
// 멤버 변수

  UrlData(
      {required this.name,
      required this.description,
      required this.image,
      required this.price});
// 생성자

  UrlData.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        description = map['description'],
        price = map['price'],
        image = map['image'];
// 생성자 함수 (이름있는생성자) Map에서 UrlData를 만들기 위해 변수명을 map으로 설정하여 Map타입의 형태를 받아온다.
}
