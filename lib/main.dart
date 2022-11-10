import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget{
  const MyApp({Key? key}) : super(key:  key);


  @override
  Widget build(BuildContext context, WidgetRef ref){


    return MaterialApp(
      title: 'task',
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home:  MyHomePage(),
    );
  }
}


class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key?key}): super (key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold();
  }
}