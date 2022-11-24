

import 'package:book/providers.dart';
import 'package:book/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'models.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget{
    const MyApp({Key? key}) : super(key:  key);



  @override
  Widget build(BuildContext context, WidgetRef ref){

    return MaterialApp(
      title: 'book',
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: MyHomePage(bookModel: Book(title: '', author: '', content: '' ,genre: ''),),
    );
  }
}




class MyHomePage extends ConsumerWidget {

  MyHomePage({Key? key, required this.bookModel}) : super(key:  key);

  final CollectionReference<Book> bookRef = FirebaseFirestore.instance.collection('books')
      .withConverter<Book>(
    fromFirestore: (snapshots, _) => Book.fromJson(snapshots.data()!),
    toFirestore: (book, _) => book.toJson(),
  );

  final Book bookModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text('蔵書一覧')
        ],),
        actions: [
          IconButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return search();})), icon: Icon(Icons.search_outlined))
        ],
      ),
      body: Column(
        children: [
          Consumer(
              builder: (context, ref, child){
                AsyncValue<QuerySnapshot> booksDocs = ref.watch(booksStream);
                final filter = ref.watch(filterProvider.state);
                final genre = ref.watch(genreProvider.state);

                return booksDocs.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (err, stack) => Text('Error:$err'),
                   data:(books) {


                    if (bookModel.genre.contains('${genre.state}')) {
                      final docs = books.docs;
                      return SizedBox(
                          height: 500,
                          child: ListView.builder(
                              itemCount: docs.length,
                              itemBuilder: (context, index) {
                                final doc = docs[index].data() as Map<String, dynamic>;
                                return
                                  ListTile(
                                    title: Text(
                                      '${doc['title']} - ${doc['author']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),), subtitle: Text('${doc['content']}'),);

                              })
                      );
                    }



                             if (bookModel.title.contains(filter.state) ||
                                 bookModel.genre.contains(filter.state) ||
                                 bookModel.content.contains(filter.state) ||
                                 bookModel.author.contains(filter.state)) {
                               final docs = bookRef.where(books,isEqualTo: filter.state);
                               return SizedBox(
                                   height: 500,
                                   child: ListView.builder(
                                       itemCount: docs.length,
                                       itemBuilder: (context, index) {
                                         final doc = docs[index].data() as Map<String, dynamic>;
                                         return
                                           ListTile(
                                             title: Text(
                                               '${doc['title']} - ${doc['author']}',
                                               style: const TextStyle(
                                                   fontWeight: FontWeight
                                                       .bold),),
                                             subtitle: Text(
                                                 '${doc['content']}'),);
                                       }
                                   )
                               );
                             }


                     final docs = books.docs;
                     return SizedBox(
                         height: 500,
                         child: ListView.builder(
                             itemCount: docs.length,
                             itemBuilder: (context, index) {
                               final doc = docs[index].data() as Map<String, dynamic>;
                               return
                                 ListTile(
                                   title: Text(
                                     '${doc['title']} - ${doc['author']}',
                                     style: const TextStyle(
                                         fontWeight: FontWeight.bold),),
                                   subtitle: Text('${doc['content']}'),);
                             }
                             )
                     );
                  });

              })
        ],
      )
    );
  }
}