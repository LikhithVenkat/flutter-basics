import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
    ),
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos= [];
  String input='';
  @override
  void initState() {
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Todos"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context,
            builder:(BuildContext context){
          return AlertDialog(
            title: Text("Add todolist"),
            content: TextField(
              onChanged: (String value){
                input=value;
              },
            ),
            actions: <Widget>[
              ElevatedButton(onPressed: (){
                setState(() {
                  todos.add(input);
                });
                Navigator.of(context).pop();
              },
                  child: Text('Add')
              )
            ],
          );
        });
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      ),
      body: ListView.builder(itemCount: todos.length,itemBuilder: (BuildContext context,int index){
        return Dismissible(key: Key(todos[index]),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                title: Text(todos[index]),
                trailing: IconButton(icon: Icon(Icons.delete),
                onPressed: (){
                  setState(() {
                    todos.removeAt(index);
                  });
                }
                  ,),
              )
        ));
      })
    );
  }
}

