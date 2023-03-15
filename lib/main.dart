import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const home());
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  static const NAMEKEY="name";
  var nameController = TextEditingController();
  SharedPreferences? pref;

  _homeState(){getSharePref();}

  Future<void> getSharePref()async{
    pref= await SharedPreferences.getInstance();
  }
  Future<void> setName(String name)async{
    try {
      await pref?.setString(NAMEKEY, name);
      print("Secssesful saved $name");
    }catch(error){
      print("object");
    }
  }
  void getName(){
    String? name=pref?.getString(NAMEKEY);
    nameController.text=name??"none";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("applecation"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("your name"),
              ),
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                setName(value);
              },
              controller: nameController,
            ),
            ElevatedButton(onPressed: () {
              getName();
            }, child: Text("save"))
          ],
        ),
      ),
    );
  }
}

