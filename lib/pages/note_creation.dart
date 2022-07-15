// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteCreation extends StatefulWidget {
  final Function noteSubmission;
  final List notes;

  const NoteCreation(this.notes, this.noteSubmission);

  @override
  State<NoteCreation> createState() => _NoteCreationState();
}

class _NoteCreationState extends State<NoteCreation> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final noteTextController = TextEditingController();
    @override
    void initState() {
      final titleController = TextEditingController();
      final noteTextController = TextEditingController();
      super.initState();
    }

    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffFFA500),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      widget.noteSubmission(
                          titleController.text, noteTextController.text);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.save_outlined,
                      color: Color(0xffFFA500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: TextField(
                controller: titleController,
                style: GoogleFonts.nunito(
                    textStyle:
                        const TextStyle(fontSize: 48, color: Colors.grey)),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: GoogleFonts.nunito(
                    textStyle:
                        const TextStyle(fontSize: 38, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: TextField(
                controller: noteTextController,
                style: GoogleFonts.nunito(
                    textStyle:
                        const TextStyle(fontSize: 23, color: Colors.grey)),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something...',
                  hintStyle: GoogleFonts.nunito(
                    textStyle:
                        const TextStyle(fontSize: 23, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
