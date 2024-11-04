import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:not_app/constans.dart';
import 'package:not_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:not_app/cubits/cubit/notes_cubit.dart';
import 'package:not_app/model/note_model.dart';
import 'package:not_app/simple_bloc_observer.dart';
import 'package:not_app/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteeModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
      ],
      child: BlocProvider(
        create: (context) => NotesCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
          home: const NotesView(),
        ),
      ),
    );
  }
}
