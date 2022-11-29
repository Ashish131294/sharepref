import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home:sharepref(),theme: ThemeData(primarySwatch: Colors.blueGrey),debugShowCheckedModeBanner: false,));
}

class sharepref extends StatefulWidget {
  const sharepref({Key? key}) : super(key: key);

  @override
  State<sharepref> createState() => _shareprefState();
}

class _shareprefState extends State<sharepref> {

  int a = 0;
  SharedPreferences? prefs;
  getpref() async {
     prefs = await SharedPreferences.getInstance();
  }


  @override
  void initState() {
    getpref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("shared_Prefrence Demo"),),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            setState(() {
              a--;
            });
          }, child: Text("-")),
        ),
        Text("$a"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            setState(() {
              a++;
            });
          }, child: Text("+")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () async {
            await prefs!.setInt('counter', a);
            
          }, child: Text("Set Value")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            final int? a = prefs!.getInt('counter')??0;
            print(a);
          }, child: Text("Get Value")),
        ),
      ],),

    );
  }
}
