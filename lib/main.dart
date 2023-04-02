import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ed = TextEditingController();
  final _kut = GlobalKey<FormState>();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Text Display"),),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("your name: $name", style: TextStyle(fontWeight: FontWeight.bold
                , fontSize: 49),),
                SizedBox(height: 30,),
                Form(
                  key: _kut,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: ed,
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                    validator: (val) {
                      if(val!.isEmpty){
                        return "Write Something";
                      }
                    }
                  ),
                ),
                TextButton(onPressed: (){
                  setState(() {
                    if(_kut.currentState!.validate()) {
                      name = ed.text;
                    }
                    else{
                      name = "";
                    }


                  });
                },
                    child: Text("Change"))
              ],

            ),
          ),
        ),
      ),
    );
  }
}
