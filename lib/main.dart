import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //내가 누구의 자식인지, 내가 무엇인지 그러한 모든 정보
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //상태 관리 변수
  int headerCount = 0;

  //상태 관리 메서드
  //값이 바뀌면 값이 바인딩된 곳이 재실행 된다. -> homePage가 재실행됨
  //즉, 눌릴때마다 new 된다.
  void add(){
    setState(() {
      headerCount++;
    });
  }
  //만약 변하는 값과 값을 호출하는 게 다르면 그 위의 부모를 건들어야하고
  //건드릴 부모가 없다면 강제로 라도 하나 만드는 것이 맞다


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: HeaderPage(headerCount)),
            Expanded(child: BottomPage(add))
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  //전달 받는 변수 초기화 할때 쓸 것이라 생성자로 받음.
  //메서드로 받아도 된다.
  //여기서 final을 붙이면 가능한가?
  final int headerCount;
  //헤더 페이지가 메모리에 한 번 만 떠 있는데, 그림을 바뀌려면 이 변수가 바뀌어야한다.
  // 번호가 바뀌어서 생성자가 계속 불러짐.
  HeaderPage(this.headerCount, {Key? key}) : super(key: key);

  //stateful 이기 때문에 setState 라는 함수를 이용해서 상태 설정 가능함
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Align(
          // alignment: ,
          //center 말고 align 사용 하기 //align 이 자신의 부모 크기 만큼 확장 된다.
          child: Text("$headerCount",
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 100,
            decoration: TextDecoration.none),
      )),
    );
  }
}



class BottomPage extends StatelessWidget {
  // Function add;
  // var add; //dynamic 도가능, 다른 타입이 들어올 수 있다.
  // 모든 변수는 final 로 만들고, 변할 수 있는 값만 final을 뺀다.
  final add;

  BottomPage(this.add, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Align(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              add();
            },
            child: Text("증가",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100)),
          ),
        ),
    );
  }
}
