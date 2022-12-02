
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models.dart';


enum Genre{any,genre1,genre2,genre3,genre4,genre5}


final booksStream = StreamProvider<QuerySnapshot<Book>>((ref) {


      final collection = FirebaseFirestore.instance.collection('books');
      final genre = ref.watch(genreProvider.state);

      if (genre.state == Genre.any) {
        return collection.withConverter<Book>(
          fromFirestore: (snapshots, _) => Book.fromJson(snapshots.data()!),
          toFirestore: (book, _) => book.toJson(),).snapshots();

      }else if (genre.state == Genre.genre1) {
        return collection.where('genre',isEqualTo: '人物・思想').withConverter<Book>(
          fromFirestore: (snapshots, _) => Book.fromJson(snapshots.data()!),
          toFirestore: (book, _) => book.toJson(),).snapshots();

      } else if (genre.state == Genre.genre2) {
        return collection.where('genre',isEqualTo:'歴史・地理').withConverter<Book>(
          fromFirestore: (snapshots, _) => Book.fromJson(snapshots.data()!),
          toFirestore: (book, _) => book.toJson(),).snapshots();

      } else if (genre.state == Genre.genre3) {
        return collection.where('genre',isEqualTo:'科学・工学').withConverter<Book>(
          fromFirestore: (snapshots, _) => Book.fromJson(snapshots.data()!),
          toFirestore: (book, _) => book.toJson(),).snapshots();

      } else if (genre.state == Genre.genre4) {
        return collection.where('genre',isEqualTo:'文学・評論').withConverter<Book>(
          fromFirestore: (snapshots, _) => Book.fromJson(snapshots.data()!),
          toFirestore: (book, _) => book.toJson(),).snapshots();

      } else {
        return collection.where('genre',isEqualTo:'アート・建築').withConverter<Book>(
          fromFirestore: (snapshots, _) => Book.fromJson(snapshots.data()!),
          toFirestore: (book, _) => book.toJson(),).snapshots();
      }

});


final genreProvider = StateProvider((ref)=> Genre.any);
final filterProvider = StateProvider((ref) => '');

