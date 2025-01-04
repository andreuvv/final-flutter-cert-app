class BookModel {
  final String title;
  final String author;
  final String coverArt;
  final String description;
  final bool favourite;
  final bool isReading;
  final num id;
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
      'favourite': favourite,
      'isReading': isReading,
      'rating': rating,
      'price': price,
      'pageNumbers': pageNumbers,
      'language': language,
    };
  }

  BookModel copyWith({
    bool? favourite,
    bool? isReading,
    required num id,
  }) {
    return BookModel(
      title: title,
      author: author,
      coverArt: coverArt,
      description: description,
      favourite: favourite ?? this.favourite,
      isReading: isReading ?? this.isReading,
      id: id,
      rating: rating,
      price: price,
      pageNumbers: pageNumbers,
      language: language,
    );
  }

  BookModel copyWithUpdateBook({
    String? title,
    String? author,
    String? coverArt,
    String? description,
    num? rating,
    num? price,
    num? pageNumbers,
    String? language,
    bool? favourite,
    bool? isReading,
    required num id,
  }) {
    return BookModel(
      title: title ?? this.title,
      author: author ?? this.author,
      coverArt: coverArt ?? this.coverArt,
      description: description ?? this.description,
      favourite: favourite ?? this.favourite,
      isReading: isReading ?? this.isReading,
      id: id,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      pageNumbers: pageNumbers ?? this.pageNumbers,
      language: language ?? this.language,
    );
  }
}
