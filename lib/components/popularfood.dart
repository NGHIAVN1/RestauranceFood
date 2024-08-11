import 'package:flutter/material.dart';

class PopularFood extends StatelessWidget {
  const PopularFood({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Card(
                      color: Colors.white,
                        
                      child: Container(
                        height: 100,
                        width: 100,
                        
                        child: Row(
                        
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.yellow
                                  ),
                                ),
                                )),
                                Expanded(
                                flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow:  [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 10.0,
                                        offset: Offset(0.0, 10.0)
                                      )
                                    ],
                                  ),
                                  child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                            margin: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            alignment: AlignmentDirectional.topStart,
                                              child: const Text(                                              
                                                'Heading 1',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                          ),
                                        ),
                                        
                                        Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                              child: const Text(
                                                'Titile 2',
                                                style: TextStyle(
                                                  fontSize: 10.0
                                                ),
                                          
                                              ),
                                                                          
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          child:const Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.star,size: 15 ,color: Color.fromARGB(255, 241, 229, 5)),
                                              Icon(Icons.star,size: 15 , color: Color.fromARGB(255, 243, 214, 24)),
                                              Icon(Icons.star,size: 15 , color: Color.fromARGB(255, 243, 214, 24)),
                                              Icon(Icons.star,size: 15 , color: Color.fromARGB(255, 243, 214, 24)),
                                              const Icon(Icons.star,size: 15 , color: Colors.black),
                                            ],
                                          )
                                          ,
                                        )
                                    ],
                                  ),
                                ),
                                ))
                          ],
                        )
                        
                      ),
                    ),
                  );
  }
}