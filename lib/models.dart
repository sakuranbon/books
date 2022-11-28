
class Book{
  Book({
    required this.title,
    required this.author,
    required this.content,
    required this.genre,
});

  Book.fromJson(Map<String, Object?> json)
  : this(
    title: json['title']! as String,
    author: json['author']! as String,
    content: json['content']! as String,
    genre: json['genre']! as String,
  );

  final String title;
  final String author;
  final String content;
  final String genre;


  Map<String, Object?> toJson(){
    return{
      'title': title,
      'author': author,
      'content': content,
      'genre': genre,
    };
  }
}