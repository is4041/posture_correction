import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "ヘルプ",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.greenAccent.shade700),
        ),
      ),
      body: ListView(
        children: [
          //Q & A
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Q & A",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Question(
              question: "このアプリはオフラインでも利用できますか？",
              answer: "はい。ですが、データの表示・保存・削除は出来ませんのでご注意ください。"),
          Question(
              question: "カメラ使用中に白点が誤作動を起こすのですが？",
              answer:
                  "逆光などでうまく顔の位置情報を取得できない場合があります。場所を変えたりカーテンを閉めるなどしてもう一度お試しください。"),
          Question(
              question: "離席中に白点が誤作動を起こすのですが？",
              answer:
                  "センサーが画面に映っている荷物や衣服などを顔と誤認識する場合があります。荷物を退けるか、離席中だけ端末を違う方向に向けておくなど工夫してみてください。"),
          Question(
              question: "このアプリを利用する際は端末の自動スリープ機能はOFFにした方がいいですか？",
              answer: "はい。スリープ状態になると計測が中断されますのでOFFにすることを強くおすすめします。"),
          Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "使い方",
              style: TextStyle(fontSize: 20),
            ),
          ),
          //チュートリアル
          Column(
            children: [
              Container(
                height: screenSize.height * 0.1,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "1.スマートフォンをセットする",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent.shade700),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white),
                        ),
                      ),
                      height: screenSize.height * 0.25,
                      child: Image.asset(
                        "images/IMG_0147.JPG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white),
                        ),
                      ),
                      height: screenSize.height * 0.25,
                      child: Image.asset(
                        "images/IMG_0146.JPG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.white),
                        ),
                      ),
                      height: screenSize.height * 0.25,
                      child: Image.asset(
                        "images/IMG_0164.JPG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: screenSize.height * 0.25,
                      child: Image.asset(
                        "images/IMG_0171.JPG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 50.0, left: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "セットをしたらstartボタンを押してカメラを起動しましょう。",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "※スマートフォン用スタンド（100均などで購入できます）を使うのがおすすめですが立てかけられる物なら何を使っても大丈夫です。",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 5,
          ),
          Column(
            children: [
              Container(
                height: screenSize.height * 0.1,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "2.白点の位置を調整する",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent.shade700),
                  ),
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: screenSize.height * 0.5,
                      width: double.infinity,
                      // color: Colors.red,
                      child: Image.asset(
                        "images/IMG_Unsplash.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 50.0, left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "姿勢を正し、鼻の位置に表示される白点が緑線の枠内に収まるように端末の位置を調整します。",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "白点が枠内から出ないように姿勢を保ち続けましょう。",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "白点が",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "下側の緑線",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent.shade700),
                          ),
                          Text(
                            "を超えて一定時間経つと通知音が鳴ります。",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//Questionクラス
class Question extends StatelessWidget {
  Question({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.greenAccent.shade700,
                  child: Text(
                    "Q",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    question,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.greenAccent.shade700),
                      color: Colors.white),
                  child: Text(
                    "A",
                    style: TextStyle(
                        fontSize: 30, color: Colors.greenAccent.shade700),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(child: Text(answer)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
