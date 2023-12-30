import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.orange,
      content: SizedBox(
        height: 200,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Name",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Task Name ...'),
            )

            // add and cancel button
          ],
        ),
      ),
    );
  }
}
