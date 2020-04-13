import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
//запуск приложения - на домашней странице
void main() => runApp(MaterialApp(home: MyApp()));

//домашняя старница
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'PhotoCode';
    var now = new DateTime.now();
    var formatter = new DateFormat.MMMMd();
    String formatted = formatter.format(now);

    //заголовок
  Widget title = Container(
        padding: const EdgeInsets.only(top: 60, bottom: 0),
        alignment: Alignment.topCenter,
        child: Text(
          "P H O T O C O D E",
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ));
  //подзаголовок
  Widget subtitle = Container(
      padding: const EdgeInsets.only(top: 5, bottom: 40),
      alignment: Alignment.topCenter,
      child: Text(
        "Today is $formatted",
        textAlign: TextAlign.right,
        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 35),
      ),
    );
  //иконка камеры
  Widget cameraIcon = Container(
    padding: const EdgeInsets.only(left: 30),
    child: Icon(
      Icons.camera_alt,
      color: Colors.white,
      size: 50,
    ),
  );

//текст на карточке
Widget cameraText = Container(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        "Scan your code",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      ),
    );
//сама карточка
  Widget cameraButton = Container(
      alignment: Alignment.topCenter,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: new InkWell(
          enableFeedback: true,
          onTap: () async{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
          },
          child: Container(
            width: 350.0,
            height: 150.0,
            child: Row(children: [
                cameraIcon, cameraText 
            ],),
          ),
        ),
        color: const Color(0xFF6C26DF),
      ),
    );
  

    //возвращаем все эти виджеты собранные в колонку(столбик)
     return MaterialApp(
      title: appTitle,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Column(
          children: [title,subtitle, cameraButton, Spacer(), /*Image.asset('assets/coder.png')*/],
        ),
      ),
    );
}
}


class SecondPage extends StatefulWidget{
  @override
  SecondRoute createState() => SecondRoute();
}

//классная страница
class SecondRoute extends State<SecondPage> {
  @override
  var img = Image.asset('assets/photo.png',
    width: 50,
    height: 50,
  );
  //это одна большая функция, в которой находятся все виджеты. Виджеты - это все: кнопки, заголовки, текст, менюшки и т. д.
  Widget build(BuildContext context) {
    //кнопка поделиться (кодом)
    Widget shareButton = FloatingActionButton(
          backgroundColor: Color(0xFF6C26DF),
          child: Icon(Icons.share, color: Colors.white,),
          onPressed: (){},
    );
      Widget galleryButton = MaterialButton(
          color: Color(0xFF6C26DF),
          onPressed: () async { 
          var path = await ImagePicker.pickImage(
          source: ImageSource.gallery,);
          print(path);
            path == null ? print("No image!"): 
            setState(() {
              img = Image.file(path);
            });
          },
          ); 

    //возвращаем все виджеты на этой странице в виде списка (со скроллингом)
    return MaterialApp(
    theme: ThemeData.dark(),
    home: Scaffold(
      appBar: AppBar(
        title: Text("Scan code"),
        backgroundColor: Color(0xFF6C26DF),
      ),
      body: ListView(
        children: <Widget>[galleryButton,img],
      ),
      floatingActionButton: shareButton,
    ));
  }
}