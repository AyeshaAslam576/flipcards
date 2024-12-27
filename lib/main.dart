import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  void Congrats() {
    if (score == 9) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Congratulations 👏"),
            content: Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfffccfd7),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Your Score is ",
                    style: TextStyle(
                        color: Color(0xffb01934), fontSize: 20),
                  ),
                  Text(
                    "${score}/9 ",
                    style: TextStyle(
                        color: Color(0xffb01934), fontSize: 60),
                  ),
                ],
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff22A92F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  List<Card> listA = [
    Card(id: 1, Image: "asset/b1.jfif", color: Colors.green, isFlipped: false, isRevealed: false),
    Card(id: 9, Image: "asset/b2.jfif", color: Colors.yellow, isFlipped: false, isRevealed: false),
    Card(id: 2, Image: "asset/b3.jfif", color: Colors.red, isFlipped: false, isRevealed: false),
    Card(id: 3, Image: "asset/b4.jfif", color: Colors.purple, isFlipped: false, isRevealed: false),
    Card(id: 4, Image: "asset/b5.jfif", color: Colors.blueAccent, isFlipped: false, isRevealed: false),
    Card(id: 5, Image: "asset/b6.jfif", color: Colors.orange, isFlipped: false, isRevealed: false),
    Card(id: 6, Image: "asset/b7.jfif", color: Colors.brown, isFlipped: false, isRevealed: false),
    Card(id: 7, Image: "asset/b8.jfif", color: Colors.grey, isFlipped: false, isRevealed: false),
    Card(id: 8, Image: "asset/b9.jfif", color: Colors.pink, isFlipped: false, isRevealed: false),
  ];
  List<Card> listB = [
    Card(id: 1, Image: "asset/b1.jfif", color: Colors.green, isFlipped: false, isRevealed: false),
    Card(id: 9, Image: "asset/b2.jfif", color: Colors.yellow, isFlipped: false, isRevealed: false),
    Card(id: 2, Image: "asset/b3.jfif", color: Colors.red, isFlipped: false, isRevealed: false),
    Card(id: 3, Image: "asset/b4.jfif", color: Colors.purple, isFlipped: false, isRevealed: false),
    Card(id: 4, Image: "asset/b5.jfif", color: Colors.blueAccent, isFlipped: false, isRevealed: false),
    Card(id: 5, Image: "asset/b6.jfif", color: Colors.orange, isFlipped: false, isRevealed: false),
    Card(id: 6, Image: "asset/b7.jfif", color: Colors.brown, isFlipped: false, isRevealed: false),
    Card(id: 7, Image: "asset/b8.jfif", color: Colors.grey, isFlipped: false, isRevealed: false),
    Card(id: 8, Image: "asset/b9.jfif", color: Colors.pink, isFlipped: false, isRevealed: false),
  ];

  int _previousCardId = 0;
  Card? _previousCard;
  bool _isListAEnabled = true;
  bool _isListBEnabled = false;

  void ShuffleCards() {
    listA.shuffle();
    listB.shuffle();
  }
  void checkGameCompletion() {
    if (listA.every((card) => card.isRevealed) && listB.every((card) => card.isRevealed)) {
      showGameCompletionDialog();
    }
  }

  void showGameCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Game Completed'),
          content: Text('Your score: $score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                restartGame();
              },
              child: const Text('Restart'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
  }
  void restartGame() {
    setState(() {
      score = 0;
      _previousCardId = 0;
      _previousCard = null;
      _isListAEnabled = true;
      _isListBEnabled = false;
      listA.forEach((card) {
        card.isFlipped= false;
        card.isRevealed = false;
      });
      listB.forEach((card) {
        card.isFlipped = false;
        card.isRevealed = false;
      });
      ShuffleCards();
    });
  }
  int score = 0;
  @override
  void initState() {
    super.initState();
    ShuffleCards();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE9D0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 40.0),
            //   child: Row(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           Navigator.of(context).pop();
            //         },
            //         icon: Icon(Icons.arrow_back),
            //         hoverColor: Color(0xffE68369),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // mainAxisSpacing: 1,
                  // crossAxisSpacing: 1,
                  childAspectRatio: 1.2,
                  // mainAxisExtent: 1.0,
                ),
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 9,
                itemBuilder: (context, index) {
                  var item = listA[index];
                  return GestureDetector(
                    onTap: _isListAEnabled
                        ? () {
                      print("${item.id}");
              
                      setState(() {
                        _previousCardId = item.id;
                        _previousCard = item;
                        item.isFlipped = true;
                        _isListAEnabled = false;
                        _isListBEnabled = true;
                      });
                    }
                        : null,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: listA[index].isFlipped
                            ? listA[index].color
                            : Color(0xffE68369),
                      ),
                      child: listA[index].isFlipped
                          ? Image.asset(listA[index].Image)
                          : null,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: 410,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                ),
                itemCount: 9,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = listB[index];
                  return GestureDetector(
                    onTap: _isListBEnabled
                        ? () async {
                      setState(() {
                        item.isFlipped = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        if (_previousCardId == item.id) {
                          item.isRevealed = true;
                          _previousCard?.isRevealed = true;
                          score++;
                          checkGameCompletion();
                        } else {
                          item.isFlipped = false;
                          _previousCard?.isFlipped = false;
                        }
                        _isListBEnabled = false;
                        _isListAEnabled = true;
                      });
                    }
                        : null,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: listB[index].isFlipped
                            ? listB[index].color
                            : Color(0xff7D8ABC),
                      ),
                      child: listB[index].isFlipped
                          ? Image.asset(listB[index].Image)
                          : null,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("Score is: ${score}"),
            ),
          ],
        ),
      ),
    );
  }
}

class Card {
  int id;
  String Image;
  Color color;
  bool isRevealed;
  bool isFlipped;
  Card({
    required this.id,
    required this.Image,
    required this.color,
    required this.isFlipped,
    required this.isRevealed,
  });
}
