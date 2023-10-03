import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future result;
  Dio dio = Dio();
  bool isNetworkConnect = true;
  bool isCheckingNetwork = false;
  bool isLoading = true;

  RefreshController refreshController = RefreshController();

  Future getData() async {
    isLoading = true;
    var url = 'https://sniperfactory.com/sfac/http_day16_dogs';

    try {
      var res = await dio.get(url);
      isLoading = false;
      return res.data['body'];
    } catch (e) {
      print(e);
    }
  }

  void onRefresh() async {
    result = getData();
    setState(() {});
    refreshController.refreshCompleted();
  }

  void checkConnectivityNetwork() async {
    isCheckingNetwork = true;
    setState(() {});

    final connectivityResult = await (Connectivity().checkConnectivity());
    await Future.delayed(const Duration(milliseconds: 1000));

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isNetworkConnect = true;
      result = getData();
    } else {
      isNetworkConnect = false;
    }
    isCheckingNetwork = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    result = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('8일차 과제'),
      ),
      body: !isCheckingNetwork && isNetworkConnect
          ? FutureBuilder(
              future: result,
              builder: (context, snapshot) {
                return SmartRefresher(
                  controller: refreshController,
                  onRefresh: onRefresh,
                  enablePullDown: true,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: snapshot.hasData ? snapshot.data.length : 6,
                    itemBuilder: (context, index) {
                      return !isLoading
                          ? Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.all(8.0),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Image.network(
                                        snapshot.data[index]['url'].toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data[index]['msg'].toString(),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.all(16.0),
                                    child: const Icon(Icons.comment),
                                  ),
                                ],
                              ),
                            )
                          : Shimmer.fromColors(
                              baseColor: Colors.blue,
                              highlightColor: Colors.black,
                              child: const Icon(Icons.rotate_left),
                            );
                    },
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isCheckingNetwork) const Text('인터넷 확인중입니다'),
                  if (!isCheckingNetwork) const Text('인터넷이 연결되지 않았습니다!'),
                  const SizedBox(height: 16),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkConnectivityNetwork();
        },
        child: const Icon(Icons.wifi_find),
      ),
    );
  }
}
