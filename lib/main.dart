
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
      home: MyHomePage()
    );
  }
}



class MyHomePage extends ConsumerWidget {

  const MyHomePage({Key? key}) : super(key:  key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text('蔵書一覧')
        ],),
        actions: [
          IconButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return const search();})), icon: const Icon(Icons.search_outlined))
        ],
      ),
        body: Column(
          children: [
            Consumer(
                builder: (context, ref, child){
                  AsyncValue<QuerySnapshot<Book>> booksDocs  = ref.watch(booksStream);
                  final filter = ref.watch(filterProvider.state);

                  return booksDocs.when(
                  loading: () => const CircularProgressIndicator(),
                      error: (err, stack) => Text('Error:$err'),
                      data:(books) {
                        if(filter.state.isNotEmpty){
                          final docs = books.docs.where((element) => element.data().author.contains(filter.state) || element.data().content.contains(filter.state) || element.data().author.contains(filter.state)).toList() ;

                          return SizedBox(
                            height: 500,
                            child: ListView.builder(
                                itemCount: docs.length,
                                itemBuilder: (context, index) {
                                  return BookTile(bookModel: docs[index].data());
                                }
                            ),
                          );
                        }

                        final docs = books.docs;
                        return SizedBox(
                          height: 500,
                          child: ListView.builder(
                              itemCount: docs.length,
                              itemBuilder: (context, index) {
                                return BookTile(bookModel: docs[index].data());
                              }
                          ),
                        );
                      });
                })
        ],
      )
    );
  }
}

class BookTile extends StatelessWidget {
  const BookTile({Key? key,required this.bookModel}) : super(key: key);

  final Book bookModel;

  @override
Widget build(BuildContext context) {
    return ListTile(
      title: Text(
    '${bookModel.title} - ${bookModel.author}',style: const TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(bookModel.content),
    );
  }
}
