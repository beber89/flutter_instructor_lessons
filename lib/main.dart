import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Map<String, String>> transactions = List<Map<String, String>>();


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller1 = TextEditingController();
    var controller2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Container(
             padding: EdgeInsets.all(10),
             child: TextField(
               controller: controller1
             ),
           ),
           Container(
             padding: EdgeInsets.all(10),
             child: TextField(
               controller: controller2,
             ),
           ),
           RaisedButton(
             onPressed: (){
               setState((){
                 transactions.add({"Expense": controller1.text, "Price": controller2.text});
               });
               print("$transactions");
             },
             child: Text("Submit"),
           ),
                Container(
                 height: 400,
                 child:ListView.builder(
                 itemCount: transactions.length,
                 itemBuilder: (ctx, idx){
                 return ListTile(
                   title: Text(transactions[idx]["Expense"]), 
                   subtitle: Text(transactions[idx]["Price"]),
                  );
               }) ,),
],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
