import 'package:flutter/material.dart';

void main(){
  runApp(new TodoApp());
}

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ("Todo App"),
      color: Colors.blue,
      home: TodoHome(),
    );
  }

}

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<String> _todo=[];
  void addItem(){
    setState(() {
      int index= _todo.length;
      _todo.add('Item'+index.toString());
    });
  }

  Widget _displayList(){
    return new ListView.builder(itemBuilder: (context,index) {
      if (index < _todo.length) {
        return _todoItem(_todo[index]);
      }
      throw '';
    }
    );
  }

  Widget _todoItem(String todoInput){
    return new ListTile(
      title: new Text(todoInput),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: ("Todo App"),
      home: new Scaffold(
          appBar: AppBar(

          ),
          body: _displayList(),
          floatingActionButton: new FloatingActionButton(
              onPressed: addItem,
              child: new Icon(Icons.add)
          )
      ),
    );
  }
}
