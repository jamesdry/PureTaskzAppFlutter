import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool completedTask;
  Function(bool?)? onChanged;
  Function(BuildContext)? delete;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.completedTask,
    required this.onChanged,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
      child: Slidable(
        // drag from left or right?
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),

        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              // checkboxes
              Checkbox(
                value: completedTask,
                onChanged: onChanged,
                activeColor: Colors.red,
                side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 2.0, color: Colors.black)),
              ),

              // task name
              Text(
                taskName,
                style: GoogleFonts.lilitaOne(
                    decoration: completedTask
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3,
                    fontSize: 25),
              ),

              // delete icon
            ],
          ),
        ),
      ),
    );
  }
}
