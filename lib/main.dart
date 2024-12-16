import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'self_introduction_C111151102',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(title: Text('我的自傳'),
        centerTitle: true,),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: currentIndex==0?Image.asset('assets/f3.jpg', width: 40, height: 40,):Image.asset('assets/f3.jpg', width: 30, height: 30,), label: '自我介紹',),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程',),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫',),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向',),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
            if (index==0) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("1.mp3"));
            }
            if (index==1) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("2.mp3"));
            }
            if (index==2) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("3.mp3"));
            }
            if (index==3) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("4.mp3"));
            }
          });
        },
      ),

    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1='我是張棆皓，是一個熱愛挑戰的大學生。在運動方面，我特別喜歡打桌球。從初次接觸這項運動開始，我便深深著迷於桌球帶來的速度感與技巧挑戰。打桌球不僅僅是單純的體育活動，更是一場心理與技術的博弈。在每一次的揮拍與擊球中，我學會了如何保持專注、快速反應，以及在壓力下做出最佳的決策。透過不斷的練習與比賽，我的技術逐漸提升，同時也培養了堅持與毅力。桌球給了我無數寶貴的經驗，這些經驗也幫助我在面對生活中的挑戰時更有信心。'
  '除了運動，我對於電腦與手機的競技遊戲同樣充滿熱情。我特別喜歡參加一些非公開的小型比賽，這不僅是一種挑戰自己的方式，更是和其他玩家切磋交流的好機會。在這些比賽中，我不僅鍛煉了自己的技術，也學會了團隊合作的重要性。電子競技讓我體會到即使是虛擬世界，也需要付出真實的努力與時間才能達到目標。我喜歡那種全力以赴追求勝利的過程，更享受在比賽中獲得成就感的喜悅。我是一個對喜歡的事物投入極高熱情的人。無論是打桌球還是玩競技遊戲，我總是投入大量的時間與心力去追求進步，力求做到最好。這種性格也反映在我的學習與生活中，當我對某件事情產生興趣時，我會主動深入研究，盡可能地掌握相關知識。我相信，唯有全心投入，才能真正體會事物的價值，並從中獲得最大的收穫。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold),),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 15,),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/f3.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/f2.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/f1.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Screen2'),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大一時期'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 200,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 學好英文'),
                    Text('2. 組合語言'),
                    Text('3. 考取證照'),
                    Text('4. 人際關係'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(),
          SizedBox(height: 10,),
          Row(),
          SizedBox(height: 10,),
          Row(),
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Screen4'),
      ),
    );
  }
}
