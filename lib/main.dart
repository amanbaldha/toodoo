import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todo = [];
  String singlevalue = "";

  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  addList() {
    setState(() {
      todo.add({"value": singlevalue});
    });
  }

  deleteItem(index){
    setState(() {
      todo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.brown.shade300,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.blueAccent.shade100,
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(1),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 80,
                                  child: Text(todo[index]['value'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                                Expanded(flex: 20, 
                                child: CircleAvatar(
                                  radius: 23,
                                  child: TextButton(
                                    onPressed: () {
                                      deleteItem(index);
                                    },
                                    child: Icon(Icons.delete,
                                    color: Colors.black, size: 30,)
                                    
                                    ),
                                )
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 70,
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            onChanged: (content) {
                              addString(content);
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                                fillColor: Colors.blueGrey.shade100,
                                filled: true,
                                labelText: 'Enter Task..',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )),
                    Expanded(flex: 3, child: SizedBox(width: 5)),
                    Expanded(
                        flex: 27,
                        child: ElevatedButton(
                          onPressed: () {
                            addList();
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(fontSize: 17),
                          ),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
