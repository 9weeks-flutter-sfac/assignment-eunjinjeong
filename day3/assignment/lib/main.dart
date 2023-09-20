import 'package:assignment/MusicTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(colorScheme: const ColorScheme.dark()),
      home: Scaffold(
        appBar: AppBar(
            shape: const Border(
                bottom: BorderSide(color: Colors.white10, width: 0.8)),
            title: const Text(
              "아워리스트",
              style: TextStyle(fontSize: 26),
            ),
            centerTitle: false,
            elevation: 0,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back_ios),
            ),
            actions: const [
              Icon(Icons.monitor, size: 30),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search, size: 30),
              ),
            ]),
        body: ListView(
          children: const [
            MusicTile(
              title: 'Come with me',
              artist: 'Surfaces 및 salem ilese • 3:00',
              image: 'assets/music_come_with_me.png',
            ),
            MusicTile(
              title: 'Good Day',
              artist: 'Surfaces • 3:00',
              image: 'assets/music_good_day.png',
            ),
            MusicTile(
              title: 'Honesty',
              artist: 'Pink Sweat\$ • 3:09',
              image: 'assets/music_honesty.png',
            ),
            MusicTile(
              title: 'I Wish I Missed My Ex',
              artist: '마할리아 버크마 • 3:24',
              image: 'assets/music_i_wish_i_missed_my_ex.png',
            ),
            MusicTile(
              title: 'Plastic Plants',
              artist: 'Surfaces • 3:20',
              image: 'assets/music_plastic_plants.png',
            ),
            MusicTile(
              title: 'Summer is for falling in love',
              artist: 'Sarah Kang & Eye Love Brandon • 3:00',
              image: 'assets/music_summer_is_for_falling_in_love.png',
            ),
            MusicTile(
              title: 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
              artist: 'Rudimental • 3:00',
              image: 'assets/music_these_days.png',
            ),
            MusicTile(
              title: 'Zombie Pop',
              artist: 'DRP IAN • 3:00',
              image: 'assets/music_zombie_pop.png',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          fixedColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "둘러보기"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), label: "보관함"),
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              color: Colors.white12,
              child: ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset('assets/music_you_make_me.png')),
                title: const Text("You Make Me"),
                subtitle: const Text("Day 6"),
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.play_arrow),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.skip_next),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              alignment: Alignment.centerLeft,
              child: Container(
                height: 14,
                width: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
