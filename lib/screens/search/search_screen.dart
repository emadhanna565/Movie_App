import 'package:flutter/material.dart';
import 'package:movie_app/screens/search/List_rearsh.dart';
class SearchScreen extends StatelessWidget {
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                    fillColor: Color(0xff282A28),
                    filled: true,
                    border: OutlineInputBorder(
                      
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.white, width: 3))),
              ),
            ),
            Expanded(child:new ListSearch(controller.text)),


          ],
        ),
      ),
    );
  }
}
