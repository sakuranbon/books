import 'package:book/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class search extends ConsumerWidget {
  const search({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final genre = ref.watch(genreProvider.state);
    final filter = ref.watch(filterProvider.state);


    return Scaffold(
        appBar: AppBar(
          title: const Text('検索条件'),
          leading: IconButton(onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.west),),
        ),
        body: Center(child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            const Text('検索条件',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

            const SizedBox(
              height: 20,
            ),
            const Text('ジャンル', style: TextStyle(color: Colors.grey),),

            Consumer(
                builder: (context, ref, _) {
                  return DropdownButton(
                      onChanged: (dynamic value){
                        genre.state = value!;},
                    value: genre.state,
                    items: const [
                      DropdownMenuItem(
                        value: Genre.any,
                        child: Text('指定なし'),
                      ),
                      DropdownMenuItem(
                        value: Genre.genre1,
                        child: Text('人物・思想'),
                      ),
                      DropdownMenuItem(
                        value: Genre.genre2,
                        child: Text('歴史・地理'),
                      ),
                      DropdownMenuItem(
                        value: Genre.genre3,
                        child: Text('科学・工学'),
                      ),
                      DropdownMenuItem(
                        value: Genre.genre4,
                        child: Text('文学・評論'),
                      ),
                      DropdownMenuItem(
                        value: Genre.genre5,
                        child: Text('アート・建築'),
                      ),
                    ],
                  );

                  }),

            const SizedBox(
              height: 30,
            ),

            const Text('フィルター', style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),),

            const SizedBox(
              height: 20,
            ),


            SizedBox(
              width: 200,
              child:
              TextField(
                onChanged: (value) {

                 filter.state = value;

                },enabled: true,
                decoration: const InputDecoration(
                  labelText: 'キーワード',
                  border: OutlineInputBorder(),

                ),
              ),
            ),

          ],
        ))

    );
  }

}
