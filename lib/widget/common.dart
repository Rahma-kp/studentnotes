import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class common extends StatelessWidget {
  const common({
    super.key,
    required TextEditingController chaptercontroller,
    required TextEditingController notecontroller,
    required this.imagelist,
    required this.documentlists,

  }) : _chaptercontroller = chaptercontroller, _notecontroller = notecontroller;

  final TextEditingController _chaptercontroller;
  final TextEditingController _notecontroller;
  final List<File> imagelist;
  final List documentlists;
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextFormField(
                        controller:_chaptercontroller,
                        style: TextStyle(
                          fontSize:35,
                          fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          hintText: "Title",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
             SizedBox(height: 30,),
            Align(
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
              height: 400,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
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
              ),
            ),
 // ---------------------------------------------imagelist------------------------------------------------------------------------
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "𝐈𝐌𝐀𝐆𝐄𝐒",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
              height: 400,
              width: 500,
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                itemCount: imagelist.length,
                itemBuilder: (context, index) {
                  final img = imagelist[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: FileImage(img), fit: BoxFit.fill)),
                    ),
                  );
                },
              ),
            ),
// -------------------------------------------file-list--------------------------------------------------------------------------------------------
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "𝐃𝐎𝐂𝐔𝐌𝐄𝐍𝐓𝐒",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
              height: 400,
              width: 500,
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                itemCount: documentlists.length,
                itemBuilder: (context, index) {
                  final dmc = documentlists[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      child: PDFView(filePath: dmc.path,)
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
