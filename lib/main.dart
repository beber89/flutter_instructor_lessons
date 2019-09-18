import 'package:flutter/material.dart';

import 'chart_bar.dart';

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

  void _showModal(context, controller1, controller2) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => Container(
            height: 350 + MediaQuery.of(context).viewInsets.bottom,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Item",
                          contentPadding: EdgeInsets.all(10)),
                      controller: controller1,
                    )),
                Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Price",
                          contentPadding: EdgeInsets.all(10)),
                      controller: controller2,
                    )),
                FlatButton(child: Text("Pick Data"), onPressed: () {}),
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: RaisedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            setState(() => transactions.add({
                                  "Commodity": controller1.text,
                                  "Price": controller2.text
                                }));
                          },
                        ))),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    var controller1 = TextEditingController();
    var controller2 = TextEditingController();
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    var chartbar = ChartBar(
                150,
                "S",
                23,
                0.5);
    final widgetsChildren = <Widget>[
      isLandscape? 
      Column(children: 
              List.filled(7, Container(
              margin: EdgeInsets.all(10),
              width: 150,
              child: chartbar
            ),)):
            Row(
              children: 
              List.filled(7, Container(
              margin: EdgeInsets.all(10),
              height: 150,
              child: chartbar
            ),)
            ,),
            Expanded(
              child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (ctx, idx) {
                    return ListTile(
                      title: Text(transactions[idx]["Commodity"]),
                      subtitle: Text(transactions[idx]["Price"]),
                    );
                  }),
            ),
          ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: isLandscape?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetsChildren,
        ):
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetsChildren,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModal(context, controller1, controller2),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
