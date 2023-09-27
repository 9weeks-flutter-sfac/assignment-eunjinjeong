import 'package:assignment2/admin_page.dart';
import 'package:flutter/material.dart';
import 'OptionCard.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List myMenue = [];

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
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    myMenue.add('떡볶이');
                    setState(() {});
                  },
                  child: const OptionCard(
                    foodName: '떡볶이',
                    imgUrl: 'assets/option_bokki.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    myMenue.add('맥주');
                    setState(() {});
                  },
                  child: const OptionCard(
                    foodName: '맥주',
                    imgUrl: 'assets/option_beer.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    myMenue.add('김밥');
                    setState(() {});
                  },
                  child: const OptionCard(
                    foodName: '김밥',
                    imgUrl: 'assets/option_kimbap.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    myMenue.add('오므라이스');
                    setState(() {});
                  },
                  child: const OptionCard(
                    foodName: '오므라이스',
                    imgUrl: 'assets/option_omurice.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    myMenue.add('오므라이스');
                    setState(() {});
                  },
                  child: const OptionCard(
                    foodName: '돈까스',
                    imgUrl: 'assets/option_pork_cutlets.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    myMenue.add('오므라이스');
                    setState(() {});
                  },
                  child: const OptionCard(
                    foodName: '라면',
                    imgUrl: 'assets/option_ramen.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    myMenue.add('오므라이스');
                    setState(() {});
                  },
                  child: const OptionCard(
                    foodName: '우동',
                    imgUrl: 'assets/option_udon.png',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
