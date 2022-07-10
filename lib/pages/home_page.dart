import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/pages/note_creation.dart';
import 'package:notesapp/pages/note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Note> notes = [
    Note(
        title: "Notes App will be my first production app ever🎉!",
        noteText: "Before celebrating the app needs to be polished first."
            " We need to have a responsive application, then we need to make "
            "it adabtive by having it look as smooth and sharp in IOS devices."),
    Note(
        title: "Life setup🗄.",
        noteText: "It's important to keep your life together by documenting "
            "everything you have, not for memories but rather to schedule "
            "your days by the hour if possible!"),
  ];
  void _addNewNote(String title, String noteText) {
    final newNote = Note(title: title, noteText: noteText);
    setState(() {
      notes.add(newNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    .1,
                width: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    .48,
                child: Row(
                  children: [
                    Text(
                      'Notes',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(fontSize: 40),
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff252525)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.info_outline),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            notes.isEmpty
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
                    child: Center(
                        child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/undraw_reminder_re_wxwu (1).svg',
                          height: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                          child: Text(
                            'Create your first note!',
                            style: GoogleFonts.nunito(
                                textStyle: const TextStyle(fontSize: 20),
                                color: Colors.white),
                          ),
                        )
                      ],
                    )),
                  )
                : Center(
                    child: SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          .9,
                      width: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          .9,
                      child: ListView.builder(
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NotePage(
                                          notes[index].title,
                                          notes[index].noteText),
                                    ),
                                  )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: Card(
                                  color: const Color(0xff252525),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 15, 0),
                                        child: Text(
                                          "title: ",
                                          style: GoogleFonts.nunito(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xFFBFBDBD))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 15, 15),
                                        child: Text(
                                          notes[index].title,
                                          style: GoogleFonts.nunito(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        itemCount: notes.length,
                      ),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ((() => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteCreation(notes, _addNewNote)),
            ))),
        backgroundColor: const Color(0xffFFA500),
        child: const Icon(
          Icons.add,
          color: Color(0xff121212),
          size: 40,
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
//   child: Center(
//       child: Column(
//     children: [
//       SvgPicture.asset(
//         'assets/svg/undraw_reminder_re_wxwu (1).svg',
//         height: 300,
//       ),
//       Padding(
//         padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
//         child: Text(
//           'Create your first note!',
//           style: GoogleFonts.nunito(
//               textStyle: const TextStyle(fontSize: 20),
//               color: Colors.white),
//         ),
//       )
//     ],
//   )),
// ),
