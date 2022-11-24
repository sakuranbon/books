
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum Genre{any,genre1,genre2,genre3,genre4,genre5}


final booksStream = StreamProvider<QuerySnapshot>((ref) {
  final collection = FirebaseFirestore.instance.collection('books');
  final genre = ref.watch(genreProvider.state);

  if (genre.state == Genre.any) {
    return collection.snapshots();
  } else if (genre.state == Genre.genre1){
    return collection.where('人物・思想').snapshots();
  }else if (genre.state == Genre.genre2){
    return collection.where('歴史・地理').snapshots();
  }else if (genre.state == Genre.genre3){
    return collection.where('科学・工学').snapshots();
  }else if(genre.state == Genre.genre4){
    return collection.where('文学・評論').snapshots();
  }else {
    return collection.where('アート・建築').snapshots();
  }
});


final genreProvider = StateProvider((ref)=> Genre.any);
final filterProvider = StateProvider((ref) => '');


