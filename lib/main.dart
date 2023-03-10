import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: _naviswipeState(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              print('shopping cart button is clicked');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('search button is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('imgs/widgettree.jpg'),
              ),
              accountName: const Text('NAME HERE'),
              accountEmail: const Text('EMAIL HERE'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[800],
              ),
              title: const Text('Home'),
              onTap: () {
                print('home is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[800],
              ),
              title: const Text('settings'),
              onTap: () {
                print('settings is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[800],
              ),
              title: const Text('Q&A'),
              onTap: () {
                print('Q&A is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SecondButton(),
          MySnackBar(),
          ToastButton(),
          CameraButton(),
          SizedBox(height: 25),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.thumb_up),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Like a new Snack bar!'),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Undosdf',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UndoPage()));
              },
            ),
          ));
        },
      ),
    );
  }
}

class ToastButton extends StatelessWidget {
  const ToastButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Toast Button'),
        onPressed: () {
          flutterToast();
        },
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: 'Toast Button',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[700],
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}

class SecondButton extends StatelessWidget {
  const SecondButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Go to the second page'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage()),
          );
        },
      ),
    );
  }
}

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Snack Bar Button'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'You pressed snack bar',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.teal,
            duration: Duration(seconds: 1),
          ));
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: const Center(
          child: Text('This is second page',
              style: TextStyle(fontSize: 20.0, color: Colors.black)),
        ));
  }
}

class UndoPage extends StatelessWidget {
  const UndoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Undo Page'),
          ),
          body: Builder(builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '???????????? ?????? ???????????????????',
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('???????????? ?????????????????????'),
                        duration: Duration(seconds: 3),
                      ));
                    },
                    child: const Text('????????????'),
                  )
                ],
              ),
            );
          })),
    );
  }
}

class CameraButton extends StatelessWidget {
  const CameraButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed:(){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CameraPage()),
              );
            },
          )
      ),
    );
  }
}

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final picker = ImagePicker();

  //????????? ????????? ?????? ???????????? ??????????????? ????????? ??????
  Future getImage(ImageSource imageSource) async{
    final image = await picker.pickImage(source: imageSource);

  // ????????? ???????????? _image??? ??????
    setState(() {
      _image = File(image!.path);
    });
  }

  //???????????? ???????????? ??????
  Widget showImage(){
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      height: 480.0,
      child: Center(
        child: _image == null
          ? Text('No image selectde')
          : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return ScaffoldMessenger(
      child: Scaffold(
        backgroundColor: const Color(0xfff4f3f9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            showImage(),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    child: Icon(Icons.add_a_photo),
                    tooltip: 'pick Image',
                    onPressed: (){
                      getImage(ImageSource.camera);
                    }
                ),

                FloatingActionButton(
                  child: Icon(Icons.wallpaper),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}

class _naviswipeState extends StatefulWidget {
  const _naviswipeState({Key? key}) : super(key: key);

  @override
  State<_naviswipeState> createState() => _naviswipeStateState();
}

class _naviswipeStateState extends State<_naviswipeState> {
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        onTap: (index){
          print('index test : ${index}');

          //?????? ?????? ??????
          setState(() {
            current_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Music'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Apps'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings'
          ),
        ],
          // ????????? index ??????
        selectedItemColor: Colors.cyan[600],
          // ???????????? index ??????
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting
          //BottomNavigationBarType.shifting : selected ??? item ??????
      ),
      body: Center(
        child: body_item.elementAt(current_index),
      )
    );
  }

  List body_item = [
    MyPage(),
    Text("music"),
    Text("apps"),
    Text("settings")
  ];
}
