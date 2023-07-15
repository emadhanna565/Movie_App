import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../local_database/modle/list_watch.dart';
import '../../main.dart';
import '../../shared/style/component/list_container.dart';
class WatchListScreen extends StatefulWidget {


  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  late Box<ListWatch> AllMovice;
  void initState() {
    // TODO: implement initState
    super.initState();
   AllMovice=Hive.box(watch);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [Text('Watch List',style: TextStyle(fontSize: 20,color: Colors.white,)),
          SizedBox(height: 10,),
          Expanded(
            child: ValueListenableBuilder(valueListenable: AllMovice.listenable(), builder: (context,Box<ListWatch>box,_)
            {
              return ListView.separated(
                
                separatorBuilder: (context, index) =>  const Padding(
                  padding: EdgeInsets.all(20),
                  child: Divider(color: Colors.white),
                ),
                itemCount: box.length,
                itemBuilder: (context, index) {
                  ListWatch? list=box.getAt(index);
                  return List_Container(title:list?.title ,posterPath: list?.posterPath,releaseDate: list?.releaseDate,);
                },
              );
            }),
          )
            
          ],
        ),

    );
  }
}
