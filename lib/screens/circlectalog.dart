import 'package:flutter/material.dart';
import 'package:main/screens/homepage.dart';

class CircleCatalog extends StatelessWidget {
  const CircleCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(                   
                    // color: Colors.yellow,
                    height: 100,
                    width: 100,
                    decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink
                   ),
                   child:  Container(
                    alignment: Alignment.bottomCenter,
                    child: const Padding(
                      padding: EdgeInsetsDirectional.only(top: 1.0),
                      child: Text('Data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                   )                  )
                  
                );
  }
}