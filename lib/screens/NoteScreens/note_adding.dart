import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/add_note_controller.dart';
import 'package:studentnot/screens/NoteScreens/add_functions.dart';

class NoteAdding extends StatefulWidget {
  const NoteAdding({super.key});

  @override
  State<NoteAdding> createState() => _NoteAddingState();
}

class _NoteAddingState extends State<NoteAdding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text(
            "𝐀𝐝𝐝 𝐂𝐡𝐚𝐩𝐭𝐞𝐫",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                onAddNoteOnClick(context);
              },
              child: const Text(
                "𝐒𝐚𝐯𝐞",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            )
          ],
          iconTheme: const IconThemeData(color: Colors.white),
        ),
// ---------------------------floating button---------------------------------------------------
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          onPressed: () {
            pickImages();
          },
          child: const Icon(Icons.add_a_photo, color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Consumer<AddNoteProvider>(
              builder: (context, values, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: values.notetitilecontroller,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: "𝐓𝐢𝐭𝐥𝐞",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '𝐒𝐞𝐥𝐞𝐜𝐭 𝐒𝐮𝐛𝐣𝐞𝐜𝐭',
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
                              controller: values.categoryController,
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
                            value: values.selectedsub,
                            items: values.sujectList.map((e) {
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
                              return values.sujectList.map((e) {
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
                              values.selectedsub = value!;
                              values.categoryController.text = value;
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
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    height: 600,
                    width: 700,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: values.chaptercontroller,
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
 // ---------------------------------------------imagelist------------------------------------
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
                    height: 600,
                    width: 900,
                    decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListView.builder(
                      itemCount: values.imagelist.length,
                      itemBuilder: (context, index) {
                        final img = values.imagelist[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onLongPress: () {
                              values.removeimage(index);
                            },
                            child: Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: FileImage(File(img)),
                                      fit: BoxFit.fill)),
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
      ),
    );
  }
  // ----------------------image picking function--------------------------------------------------
  Future<void> pickImages() async {
    final imagesss = Provider.of<AddNoteProvider>(context, listen: false);
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImages != null) {
      final imageFile = File(pickedImages.path);
      final imagePath = imageFile.path;
      imagesss.addimage(imagePath);
    }
  }
}
