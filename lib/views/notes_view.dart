import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/constans.dart';
import 'package:not_app/cubits/cubit/notes_cubit.dart';
import 'package:not_app/widget/add_note_buttom_sheet.dart';
import 'package:not_app/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return AddNoteButtomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: const NotesViewBody(),
    );
  }
}
