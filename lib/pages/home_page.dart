import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puretaskz_flutter/util/dialog_box.dart';
import 'package:puretaskz_flutter/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final style = const TextStyle();
  int _currentIndex = 0;

  // list of to do tasks
  final List toDoList = [
    ["Take A Shower", false],
    ["Take A Shower", false],
  ];

  // checkbox was clicked
  void changeCheckbox(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // create new task
  void createNewTaskz() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DialogBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.yellow,
          title: Text(
            "PureTaskz",
            style: GoogleFonts.lilitaOne(textStyle: style, fontSize: 50),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTaskz,
          backgroundColor: Colors.orange,
          elevation: 10.0,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskName: toDoList[index][0],
                completedTask: toDoList[index][1],
                onChanged: (value) => changeCheckbox(value, index));
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: Colors.black,
              ),
              label: "About",
            )
          ],
        ),
      ),
    );
  }
}
