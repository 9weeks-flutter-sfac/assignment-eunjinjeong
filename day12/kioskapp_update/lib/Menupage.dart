import 'package:assignment2/OptionCard.dart';
import 'package:assignment2/admin_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  SharedPreferences? prefs;
  Dio dio = Dio();
  List myMenue = [];

  Future<List<dynamic>> getData() async {
    var res = await dio
        .get('http://52.79.115.43:8090/api/collections/options/records');
    if (res.statusCode == 200) {
      return (res.data['items']);
    }

    return [];
  }

  initPrefernces() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      var myList = prefs!.getStringList('myMenuList');
      myMenue = myList ?? [];
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefernces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: myMenue.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {}, label: const Text('결제하기'))
          : null,
      appBar: AppBar(
        title: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const adminPage(),
              ),
            );
            setState(() {});
          },
          child: const Text(
            "분식왕 이테디 주문하기",
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "주문 리스트",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              height: 50,
              child: myMenue.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return Chip(
                          label: Text(myMenue[index]),
                          onDeleted: () {
                            myMenue.removeAt(index);
                            setState(() {});
                          },
                        );
                      },
                      itemCount: myMenue.length,
                      scrollDirection: Axis.horizontal,
                    )
                  : const Center(child: Text('주문한 메뉴가 없습니다.'))),
          const SizedBox(height: 8),
          const Text(
            "음식",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(
            // girdview를 사용해서 데이터를 보여줄 거기 때문에 futurebuilder 이용.
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GridView.builder(
                      // list가 몇개 들어올지 모르기 때문에 gridview가 아닌 gridview builder를 이용
                      itemCount: snapshot.data?.length ??
                          0, //snapshot.data가 null일 수 있으니 null이 아닐때만 Length 접근. 만약 null이라면 0을 반환
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return OptionCard(
                            imgUrl: snapshot.data![index]["imageUrl"],
                            foodName: snapshot.data![index]["menu"],
                            onTap: () {
                              if (prefs != null) {
                                prefs!.setStringList(
                                    'myMenuList',
                                    myMenue
                                        .map((item) => item.toString())
                                        .toList());
                              }
                              setState(() {
                                myMenue.add(snapshot.data![index]['menu']);
                              });
                            });
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                }),
          ),
        ],
      ),
    );
  }
}
