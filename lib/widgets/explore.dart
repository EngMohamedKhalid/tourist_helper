import 'package:flutter/material.dart';
class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: TextFormField(
                decoration:InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: ' Explore Trends ',
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(30) )
                ) ,
              ),
            ),
          ],
        ), 
      ),
    );
  }
}
