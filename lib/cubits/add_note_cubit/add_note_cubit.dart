import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:not_app/constans.dart';
import 'package:not_app/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = const Color(0xffAC3931);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());

    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      // bool isLoading = false;
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      // bool isLoading = false;
      emit(AddNoteFailure(e.toString()));
    }
  }
}
