import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/widgets/dict_card.dart';

import '../model/dict.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dict? dict;
  Dio dio = Dio();

  search(String query) async {
    var url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
    try {
      var res = await dio.get(url + query);
      var data = res.data.first;
      dict = Dict.fromMap(data);
      print(dict);
      setState(() {}); // 화면 새로고침으로 dict에 새로운 값 넣어주기
    } catch (e) {
      dict = null;
      setState(() {});
    }
  } // json파일에 없는 단어가 있을 경우 에러가 나지 않도록 try-catch문으로 예외 처리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSubmitted: (value) {
                        search(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            if (dict != null)
              //dict는 required이기 때문에 꼭 값이 있어야 하는데 null이 될 수 있다. !만 붙이고 끝내기에는 제일 처음 실행할 때 무조건 null로 시작하기 때문에 에러가 나지 않도록 if 문을 넣자.

              Expanded(
                child: SingleChildScrollView(child: DictCard(dict: dict!)),
              ),
// scroll이 되지 않기 때문에 사이즈 에러가 발생한다. => expanded를 넣어 dictcard 영역이 확장할 수 있을만큼 확장하게 하고 singlescrollview로 스스로 스크롤 하게 한다.
          ],
        ),
      ),
    );
  }
}
