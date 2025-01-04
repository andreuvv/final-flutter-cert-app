import 'package:dio/dio.dart';
import 'package:flutter_cert_final/models/book_model.dart';

class BookListService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://flutter-cert-11f7d-default-rtdb.firebaseio.com/books';

  Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await _dio.get('$baseUrl.json');
      if (response.data != null) {
        final data = response.data as Map<String, dynamic>;
        return data.entries.map((entry) {
          final book = BookModel.fromMap(entry.value);
          return book.copyWith(id: entry.value['id']);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching books: $e');
      throw Exception('Failed to load books');
    }
  }

  Future<void> addBook(BookModel book) async {
    try {
      await _dio.post('$baseUrl.json', data: book.toMap());
    } catch (e) {
      print('Error adding book: $e');
      throw Exception('Failed to add book');
    }
  }

  Future<void> updateBook(BookModel book) async {
    try {
      await _dio.put('$baseUrl/book${book.id}.json', data: book.toMap());
    } catch (e) {
      print('Error updating book: $e');
      throw Exception('Failed to update book');
    }
  }

  Future<void> deleteBook(int bookId) async {
    try {
      await _dio.delete('$baseUrl/$bookId.json');
    } catch (e) {
      print('Error deleting book: $e');
      throw Exception('Failed to delete book');
    }
  }
}
