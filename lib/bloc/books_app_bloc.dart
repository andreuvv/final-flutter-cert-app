import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/models/book_model.dart';
import 'package:flutter_cert_final/services/book_list_service.dart';

/// Events
abstract class BooksEvent {}

class FetchBooksEvent extends BooksEvent {}

class AddBookEvent extends BooksEvent {
  final BookModel book;
  AddBookEvent(this.book);
}

class UpdateBookEvent extends BooksEvent {
  final BookModel book;
  UpdateBookEvent(this.book);
}

class DeleteBookEvent extends BooksEvent {
  final BookModel book;
  DeleteBookEvent(this.book);
}

/// States
abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<BookModel> books;
  BooksLoaded(this.books);
}

class BooksError extends BooksState {
  final String message;
  BooksError(this.message);
}

/// BLoC
class BooksAppBloc extends Bloc<BooksEvent, BooksState> {
  final BookListService bookService;

  BooksAppBloc(this.bookService) : super(BooksInitial()) {
    on<FetchBooksEvent>((event, emit) async {
      emit(BooksLoading());
      try {
        final books = await bookService.fetchBooks();
        emit(BooksLoaded(books));
      } catch (e) {
        emit(BooksError(e.toString()));
      }
    });

    on<AddBookEvent>((event, emit) async {
      try {
        await bookService.addBook(event.book);
        final books = await bookService.fetchBooks();
        emit(BooksLoaded(books));
      } catch (e) {
        emit(BooksError(e.toString()));
      }
    });

    on<UpdateBookEvent>((event, emit) async {
      try {
        await bookService.updateBook(event.book);
        final books = await bookService.fetchBooks();
        emit(BooksLoaded(books));
      } catch (e) {
        emit(BooksError(e.toString()));
      }
    });

    on<DeleteBookEvent>((event, emit) async {
      try {
        await bookService.deleteBook(event.book);
        final books = await bookService.fetchBooks();
        emit(BooksLoaded(books));
      } catch (e) {
        emit(BooksError(e.toString()));
      }
    });
  }
}
