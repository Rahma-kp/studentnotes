import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/note_editing_controller.dart';
import 'package:studentnot/contoller/notedb_provider.dart';
import 'package:studentnot/model/note_model.dart';

class NotEditingScreen extends StatefulWidget {
  final String notetitle;
  final String note;
  final String catogery;
  final List imagelists;
  final int index;
  const NotEditingScreen(
      {super.key,
      required this.notetitle,
      required this.note,
      required this.catogery,
      required this.imagelists,
      required this.index});

  @override
  State<NotEditingScreen> createState() => _NotEditingScreenState();
}

class _NotEditingScreenState extends State<NotEditingScreen> {
  // late NotEditingProvider provider;
  @override
  void initState() {
   
    final pro=Provider.of<NotEditingProvider>(context,listen: false);
    pro.categoryController.text=widget.catogery;
    pro.chaptercontroller.text=widget.note;
    pro.notetitilecontroller.text=widget.notetitle;
    pro.imagelist=List.from(widget.imagelists);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<NotEditingProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 158, 156, 156),
        appBar: AppBar(
          actionsIconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text("Edit", style: TextStyle(color: Colors.white)),
          actions: [
            Consumer<notedbprovider>(
              builder: (context, value, child) => TextButton(
                  onPressed: () async {
                    // value.editnote(widget.index,
                    //     NotesData(notetitle: '', note: '', category: ''));

                    await onclick();
                  },
                  child: const Text(
                    "𝐒𝐚𝐯𝐞",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            )
          ],
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          onPressed: () {
            pickImages();
          },
          child: const Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ChangeNotifierProvider(
              create: (context) => provider,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: provider.notetitilecontroller,
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
                              controller: provider.categoryController,
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
                            value: provider.selectedsub,
                            items: provider.sujectList.map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Text(e,
                                        style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                              );
                            }).toList(),
                            selectedItemBuilder: (BuildContext context) {
                              return provider.sujectList.map((e) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(width: 10),
                                    Text(e,
                                        style: const TextStyle(fontSize: 18)),
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
                              provider.selectedsub = value!;
                              provider.categoryController.text = value;
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
                    height: 700,
                    width: 700,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: provider.chaptercontroller,
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
                    height: 700,
                    width: 700,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: provider.imagelist.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () {
                                provider.removeImage(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  File(provider.imagelist[index]),
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//----------------------image picking--------------------------------------------------
  Future<void> pickImages() async {
    final provider=Provider.of<NotEditingProvider>(context,listen: false);
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImages != null) {
      final imageFile = File(pickedImages.path);
      final imagePath = imageFile.path;
      provider.pickImage(imagePath);
    }
  }

  Future<void> onclick() async {
    final provd = Provider.of<NotEditingProvider>(context, listen: false);
    final combinedImageList =
        [...widget.imagelists, ...provd.imagelist].toSet().toList();
    final update = NotesData(
      notetitle: provd.notetitilecontroller.text,
      note: provd.chaptercontroller.text,
      category: provd.categoryController.text,
      imagelists: combinedImageList,
    );
    await Provider.of<notedbprovider>(context, listen: false)
        .editnote(widget.index, update);
    Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      margin: EdgeInsets.all(10),
      backgroundColor: Color.fromARGB(255, 199, 89, 89),
      behavior: SnackBarBehavior.floating,
      content: Text("Updated successfully"),
    ));
  }
  
}
