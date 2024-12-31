import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/bloc/books_app_bloc.dart';
import 'package:flutter_cert_final/services/book_list_service.dart';
import 'package:flutter_cert_final/ui/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FinalFlutterCertApp());
}

class FinalFlutterCertApp extends StatelessWidget {
  const FinalFlutterCertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BooksAppBloc(BookListService())..add(FetchBooksEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Firebase Books Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
