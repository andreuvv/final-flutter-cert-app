import 'package:dio/dio.dart';
import 'package:flutter_cert_final/models/book_model.dart';

class BookListService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://flutter-cert-11f7d-default-rtdb.firebaseio.com/books';

  Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await _dio.get(baseUrl);
      return (response.data as List).map((book) => BookModel.fromMap(book)).toList();
    } catch (e) {
      throw Exception('Failed to load books');
    }
  }

  Future<void> addBook(BookModel book) async {
    try {
      await _dio.post(baseUrl, data: book.toMap());
    } catch (e) {
      throw Exception('Failed to add book');
    }
  }

  Future<void> updateBook(BookModel book) async {
    try {
      await _dio.put('$baseUrl/${book.id}', data: book.toMap());
    } catch (e) {
      throw Exception('Failed to update book');
    }
  }

  Future<void> deleteBook(int bookId) async {
    try {
      await _dio.delete('$baseUrl/$bookId');
    } catch (e) {
      throw Exception('Failed to delete book');
    }
  }
}
