import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CallApp());
}

class CallApp extends StatelessWidget {
  const CallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Phone_Call(),
    );
  }
}

class Phone_Call extends StatefulWidget {
  const Phone_Call({super.key});

  @override
  State<Phone_Call> createState() => _Phone_CallState();
}

class _Phone_CallState extends State<Phone_Call> {
  TextEditingController call = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50),
        child: AppBar(
          backgroundColor: Color.fromARGB(120,112,222,1),
          title: const Text(
            "Phone Call",
            style: TextStyle(fontSize: 15,letterSpacing: 0.5,wordSpacing: 0.5,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(color: Color.fromRGBO(190,190,190,1),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: "Enter Number", hintText: "Number",),
                    controller: call,
                    keyboardType: TextInputType.phone)),
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: Color.fromRGBO(219, 147, 112, 1),
                   padding: const EdgeInsets.all(3),
                   textStyle: const TextStyle(
                       fontSize: 17, fontWeight: FontWeight.bold),
                 ),
                 onPressed: () async {
                   final url = "tel:${call.text}";
                   await launch(url);
                 },
                 child: Text("calll",style: TextStyle(fontSize: 15,wordSpacing: 0.5,fontWeight: FontWeight.bold,letterSpacing: 0.5),)),
             IconButton(
               style: ElevatedButton.styleFrom(
                 primary: Color.fromRGBO(219, 147, 112, 1),
                 padding: const EdgeInsets.all(3),
                 textStyle: const TextStyle(
                     fontSize: 17, fontWeight: FontWeight.bold),
               ),onPressed: () async {
               final url = "tel:${call.text}";
               await launch(url);
             }, icon: Icon(Icons.call,color: Colors.teal,size: 45,),color: Colors.green,iconSize: 50.0,)
           ],)


          ],
        ),


      ),
    );
  }
}
