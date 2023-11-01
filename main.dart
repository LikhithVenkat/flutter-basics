import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  ),
);

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int num=0;
  List<String> quote=['1','2','3','4','5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('my first app'),
    centerTitle: true,
    backgroundColor: Colors.deepPurpleAccent,
      elevation: 0,
    ),
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(backgroundColor: Colors.grey, radius: 5.0,),
            Divider(color: Colors.grey,height: 10.0,),
            Text('$num'),
            Icon(
              Icons.airport_shuttle,
              color: Colors.deepPurpleAccent,
              size: 20.0,
            ),
            SizedBox(height: 10.0,),
            Container(
              color: Colors.grey,
              padding: EdgeInsets.all(10.0),
              child: Text('Likhith Venkat'),
            ),
            ElevatedButton(
                onPressed: (){},
                child: Text('hello. this is elevated button'),
            ),
            IconButton(
                onPressed:  (){},
                icon: Icon(Icons.airport_shuttle),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(30.0),
                    color: Colors.amber,
                    child: Text('1'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(30.0),
                    color: Colors.green,
                    child: Text('2'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(30.0),
                    color: Colors.blueAccent,
                    child: Text('3'),
                  ),
                ),
                Row(
                  children: quote.map((e) => Text(e)).toList(),
                ),
              ],
            ),
            Card(
              child: Text('hi'),
              elevation: 10.0,
              color: Colors.grey[200],
            )
          ],
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: (){
      setState(() {
        num+=1;
      });
    },
    backgroundColor: Colors.deepPurpleAccent,
    child: Text('Click'),
    ),
    );
  }
}


/*
initRoute='/home',
 routes={
 '/':(context)=>Home(),
 },

 Navigator.pushNamed(context,'/location'); in button


 initState(){
super.initState();
}
build()
Dispose()

void getdata async{
await Future.delayed(Duration(seconds:3),(){
});

http in pub.dev
response response=await get('link');
print(response.body)
import dart:convert
Map data=jsonDecode(response.body)
data[].substring(1,3);
DateTime now=DateTime.parse(datetime);
now = now.add(Duration(hours: int.parse(offset)));
time=now.toString();
Future<void> getTime() async

Navigator.pushReplacementNamed(context,'/home',arguments:{
'location':instance.location,
});
ModalRoute.of(context).settings.arguments;    in build


intl package
time=DataFormat.jm().format(now);

flutter_spinkit
fit: Boxfit.cover for img

body: ListView.builder(
itemcount,itembuilder:(context,index)
)
Card(
ListTile
 */



/* Custom painter

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drawing Primitives in Flutter'),
        ),
        body: Center(
          child: CustomPaint(
            size: Size(200, 200),
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Draw a line
    canvas.drawLine(Offset(10, 10), Offset(100, 10), paint);

    // Draw a rectangle
    Rect rect = Rect.fromPoints(Offset(10, 30), Offset(100, 100));
    canvas.drawRect(rect, paint);

    // Draw a circle
    canvas.drawCircle(Offset(155, 65), 30, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

 */


/*
calculator

 import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        if (num2 != 0) {
          _output = (num1 / num2).toString();
        } else {
          _output = "Error";
        }
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output += buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Text(
              output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("C"),
                  buildButton("0"),
                  buildButton("="),
                  buildButton("+"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

 */


/* RSS feed app
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

void main() {
  runApp(MyRSSFeedApp());
}

class MyRSSFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RSSFeedScreen(),
    );
  }
}

class RSSFeedScreen extends StatefulWidget {
  @override
  _RSSFeedScreenState createState() => _RSSFeedScreenState();
}

class _RSSFeedScreenState extends State<RSSFeedScreen> {
  String rssFeedUrl = "YOUR_RSS_FEED_URL";
  RssFeed feed;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(rssFeedUrl));
    if (response.statusCode == 200) {
      setState(() {
        feed = RssFeed.parse(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSS Feed App'),
      ),
      body: feed == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: feed.items.length,
              itemBuilder: (context, index) {
                final item = feed.items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.pubDate),
                  onTap: () {
                    // Handle item click, e.g., open the full article.
                  },
                );
              },
            ),
    );
  }
}

 */