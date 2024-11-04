import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/constans.dart';
import 'package:not_app/cubits/cubit/notes_cubit.dart';
import 'package:not_app/model/note_model.dart';
import 'package:not_app/widget/colors_list_view.dart';
import 'package:not_app/widget/custom_app_bar.dart';
import 'package:not_app/widget/custom_text_filed.dart';
import 'package:not_app/widget/edite_list_view_colors.dart';

class EditeNoteViewBody extends StatefulWidget {
  const EditeNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditeNoteViewBody> createState() => _EditeNoteViewBodyState();
}

class _EditeNoteViewBodyState extends State<EditeNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = title ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edite NOte',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFiled(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title),
          SizedBox(
            height: 16,
          ),
          CustomTextFiled(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.subTitle,
            maLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditeNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}



