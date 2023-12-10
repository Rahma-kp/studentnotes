import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/note_db.dart';

// ignore: must_be_immutable
class NotEditingScreen extends StatefulWidget {
  final String notetitle;
  final String note;
  final String catogery;
 late final  List documentlist;
  final List imagelists;
  final int index;
  NotEditingScreen(
      {super.key,
      required this.notetitle,
      required this.note,
      required this.catogery,
      required this.documentlist,
      required this.imagelists,
      required this.index});

  @override
  State<NotEditingScreen> createState() => _NotEditingScreenState();
}

class _NotEditingScreenState extends State<NotEditingScreen> {
  TextEditingController _notetitilecontroller = TextEditingController();
  TextEditingController _chaptercontrolle = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  final List<String> _imagelist = [];
  List<dynamic> _documentlists = [];
  final List<String> _sujectList = [
    'SUBJECTS',
    'Language',
    'English',
    'Physics',
    'Mathematics',
    'Chemistry',
    'Social Science',
    'Biology',
    'Zoology',
    'Botany',
    'Computer',
    'Environmental ',
    'Geography',
    'Health Sciences',
  ];
  String selectedsub = 'SUBJECTS';

  @override
  void initState() {
    _notetitilecontroller = TextEditingController(text: widget.notetitle);
    _chaptercontrolle = TextEditingController(text: widget.note);
    _categoryController = TextEditingController(text: widget.catogery);
    _imagelist != List.from(widget.imagelists);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 158, 156, 156),
        appBar: AppBar(
          actionsIconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text("Edit", style: TextStyle(color: Colors.white)),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    editsaveonclick();

                    ///
                  });
                },
                child: const Text(
                  "𝐒𝐚𝐯𝐞",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          animatedIconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          children: [
            SpeedDialChild(
              child:
                  const Icon(Icons.add_a_photo_outlined, color: Colors.white),
              backgroundColor: const Color.fromARGB(207, 13, 20, 78),
              onTap: () {
                pickImages();
              },
            ),
            SpeedDialChild(
                child: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                ),
                backgroundColor: const Color.fromARGB(207, 13, 20, 78),
                onTap: () {
                  // pickFiless();
                })
          ],
        ),
        // --------------------------------------------------------------------------------
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _notetitilecontroller,
                  decoration: const InputDecoration(
                    hintText: "Titile",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select the subject',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _categoryController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        DropdownButton<String>(
                          value: selectedsub,
                          items: _sujectList.map((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Text(e, style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                            );
                          }).toList(),
                          selectedItemBuilder: (BuildContext context) {
                            return _sujectList.map((e) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(width: 10),
                                  Text(e, style: const TextStyle(fontSize: 18)),
                                ],
                              );
                            }).toList();
                          },
                          hint: const Text(
                            'Select',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          underline: Container(),
                          onChanged: (value) {
                            setState(() {
                              selectedsub = value!;
                              _categoryController.text = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "𝐍𝐎𝐓𝐄𝐒",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  height: 400,
                  width: 700,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _chaptercontrolle,
                      keyboardType: TextInputType.multiline,
                      maxLines: 20,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Start writing.........",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "𝐈𝐌𝐀𝐆𝐄𝐒",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  height: 400,
                  width: 700,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: widget.imagelists.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: () {
                              setState(() {
                                widget.imagelists.removeAt(index);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.file(
                                File(widget.imagelists[index]),
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "𝐃𝐎𝐂𝐔𝐌𝐄𝐍𝐓𝐒",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 400,
                  width: 500,
                  decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  ListView.builder(
                    itemCount: _documentlists.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            openFile(_documentlists[index]);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              tileColor:
                                  const Color.fromARGB(221, 130, 136, 147),
                              title: Text(_documentlists[index].name),
                              subtitle: Text('${_documentlists[index].path}'),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _documentlists.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.close)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImages != null) {
      final imageFile = File(pickedImages.path); // Convert XFile to File
      final imagePath = imageFile.path;

      setState(() {
        _imagelist.add(imagePath);
      });
    }
  }

  void pickFiless() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _documentlists = result.files;
      });
    }
  }

  Future<void> openFile(PlatformFile file) async {
    final filePath = file.path;
    final fileName = file.name;

    try {
      await OpenFile.open(filePath);
      print(fileName);
    } catch (error) {
      print(error);
    }
  }

  editsaveonclick() async {
    final editedTitile = _notetitilecontroller.text.trim();
    final editedNote = _chaptercontrolle.text.trim();
    final editedCategoery = _categoryController.text.trim();
    if (editedTitile.isEmpty || editedNote.isEmpty || editedCategoery.isEmpty) {
      return;
    }
    final updatedNonte = NotesData(
        notetitle: editedTitile,
        note: editedNote,
        category: editedCategoery,
        documentlist: [],
        imagelists: _imagelist);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      margin: EdgeInsets.all(10),
      backgroundColor: Color.fromARGB(255, 199, 89, 89),
      behavior: SnackBarBehavior.floating,
      content: Text("updated successfully"),
    ));
    setState(() {
      editnote(widget.index, updatedNonte);
    });

    Navigator.of(context).pop();
  }
}
