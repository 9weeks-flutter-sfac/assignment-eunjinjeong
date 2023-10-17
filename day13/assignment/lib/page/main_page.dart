import 'package:assignment/widgets/post_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/post.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> readData() async {
    //Post라는 이름의 List를 가져온다 -> Post라는 class 만들기
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      // print(res.data);
      var data = List<Map<String, dynamic>>.from(
          res.data); //Map<String, dynamic>을 from을 통해 확실히 가져오겠다.
      return data
          .map((e) => Post.fromMap(e))
          .toList(); //data의 데이터 타입은 Map이기 떄문에 .map을 사용할 수 있음 -> map을 활용해 post안에 있는 요소를 전부다 가져온다.
    } // map이 전달해주는 건 interable이기 때문에 toList가 필요함.
    return [];
  }

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      body: FutureBuilder(
        future: readData(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // return Text(snapshot.data.toString());
            return ListView.separated(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) =>
                  // Text(snapshot.data![index].title),
                  postCard(post: snapshot.data![index]),
              separatorBuilder: (context, index) => ((index + 1) % 5 ==
                      0 // 5로 딱 나누어 떨어지면. 그런데 프로그래밍 언어의 시작은 0이기 때문에 첫번째는 무조건 나머지가 0. 시작을 1로 만들어주기 위해 index에 1을 더함
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Post ${index + 2} ~ ${index + 6}',
                        style: const TextStyle(fontSize: 30),
                      ),
                    )
                  : const SizedBox()),
            );
          }
          return const LinearProgressIndicator();
        },
      ),
    );
  }
}
