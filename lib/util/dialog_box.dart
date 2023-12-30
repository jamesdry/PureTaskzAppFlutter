import 'package:flutter/material.dart';
import 'package:puretaskz_flutter/util/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onPressCancel;
  VoidCallback onPressAdd;

  DialogBox({
    super.key,
    required this.controller,
    required this.onPressCancel,
    required this.onPressAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange,
      content: SizedBox(
        height: 200,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Task Name",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: controller,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              autofocus: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Task Name ...'),
            ),

            // add and cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // cancel button
                TheButtons(
                  text: 'Cancel',
                  onButtonPressed: onPressCancel,
                ),

                const SizedBox(width: 10.0),

                // add button
                TheButtons(
                  text: 'Add',
                  onButtonPressed: onPressAdd,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
