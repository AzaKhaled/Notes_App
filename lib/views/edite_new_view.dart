import 'package:flutter/material.dart';
import 'package:not_app/model/note_model.dart';
import 'package:not_app/views/edit_view_body.dart';

class EditeNoteView extends StatelessWidget {
  const EditeNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditeNoteViewBody(
        note: note,
        ),
    );
  }
}
