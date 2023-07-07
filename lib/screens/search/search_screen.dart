import 'package:flutter/material.dart';
import 'package:movie_app/screens/search/List_rearsh.dart';
class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white,fontSize: 25),
                decoration:  InputDecoration(
                  suffixIcon: IconButton(onPressed:(){
                    setState(() {
                    controller.clear();
                    });
                  }, icon: Icon(Icons.close,color: Colors.white,)),
                  prefixIcon:IconButton(onPressed:(){
                    setState(() {

                    });
                  }, icon: Icon(Icons.search,color: Colors.white,)),

                    fillColor: Color(0xff282A28),
                    filled: true,
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.white, width: 3))),
              ),
            ),
            Expanded(child: ListSearch(controller.text)),


          ],
        ),
      ),
    );
  }
}
