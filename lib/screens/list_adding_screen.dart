import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentnot/screens/notes_listview.dart';

class list_adding_screen extends StatefulWidget {
  list_adding_screen({super.key});

  @override
  State<list_adding_screen> createState() => _list_adding_screenState();
}

class _list_adding_screenState extends State<list_adding_screen> {
  final _notecontroller = TextEditingController();

  late List<dynamic> imagelist = [];
  late List<dynamic> documentlists = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(207, 13, 20, 78),
          title: Text("Add chapter"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => listview_screen(),
                  ));
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          backgroundColor: Color.fromARGB(207, 13, 20, 78),
          children: [
            SpeedDialChild(
              child: Icon(Icons.add_a_photo_outlined, color: Colors.white),
              backgroundColor: Color.fromARGB(207, 13, 20, 78),
              onTap: () {
                // pickImages();
              },
            ),
            SpeedDialChild(
              child: Icon(
                Icons.picture_as_pdf,
                color: Colors.white,
              ),
              backgroundColor: Color.fromARGB(207, 13, 20, 78),
              onTap: () {
                // pickDocuments();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: _notecontroller,
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    hintText: "Start writing.........",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                // ---------------------------------------------imagelist------------------------------------------------------------------------
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListView.builder(
                        itemCount: imagelist.length,
                        itemBuilder: (context, index) {
                          final imgpath = imagelist[index];
                          return Container(child: Image.file(imgpath));
                        },
                      ),
                    ],
                  ),
                ),
                // -------------------------------------------file-list--------------------------------------------------------------------------------------------
                //           Center(
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //           Expanded(
                //             child: ListView.builder(
                // itemCount: documentlists.length,
                // itemBuilder: (context, index) {
                // final document = documentlists[index];
                // return Container(
                //   child: Text('Size: ${document.size} bytes'),
                // );
                // },
                //             ),
                //           ),
                //   ],
                // ),
                // ),
                // ------------------------------------------------------------------------------------------------------------------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
  // image picking function--------------------------------------------------

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImages != null) {
      setState(() {
        imagelist.add(pickedImages);
      });
    }
  }

  // // file picking function--------------------------------------------------------
  Future<void> pickDocuments() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Allow multiple file selection
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      setState(() {
        documentlists = result.files;
      });
    }
  }
}
