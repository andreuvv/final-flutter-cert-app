class BookModel {
  final String title;
  final String author;
  final String coverArt;
  final String description;
  final bool favourite;
  final bool isReading;
  final int id;
  final num rating;
  final num price;
  final num pageNumbers;
  final String language;

  BookModel({
    required this.title,
    required this.author,
    required this.coverArt,
    required this.description,
    required this.favourite,
    required this.isReading,
    required this.id,
    required this.rating,
    required this.price,
    required this.pageNumbers,
    required this.language,
  });

  factory BookModel.fromMap(Map<String, dynamic> data) {
    return BookModel(
      id: data['id'],
      title: data['title'],
      author: data['author'],
      coverArt: data['coverArt'],
      description: data['description'],
      favourite: data['favourite'],
      isReading: data['isReading'],
      rating: data['rating'],
      price: data['price'],
      pageNumbers: data['pageNumbers'],
      language: data['language'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'coverArt': coverArt,
      'description': description,
      'isFavourite': favourite,
      'isReading': isReading,
      'rating': rating,
      'price': price,
      'pageNumbers': pageNumbers,
      'language': language,
    };
  }
}
