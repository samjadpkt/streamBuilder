import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: StreamBuilder<int?>(
      stream: getnumber(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
       else if(snapshot.hasData){
         int value=snapshot.data!;
          return Text(value.toString());
        }
       else if(snapshot.hasError){
         return Text("Error");
        }
       else{
         return Text("No Data");
        }
      },
    ),),);
  }
}

Stream<int?> getnumber() async* {
  await Future.delayed(Duration(seconds: 4));
  //yield is a keyword used for returning values,here we cant use return keyword because here we want to return more than one value
 yield 1;
  await Future.delayed(Duration(seconds: 4));
  yield 2;
  await Future.delayed(Duration(seconds: 4));
  yield null;
  await Future.delayed(Duration(seconds: 4));
  //throw keyword is used to  throw an exception. Exceptions are used to handle error conditions or exceptional situations that occur during the execution of a program.

  throw Exception('an error') ;

}
