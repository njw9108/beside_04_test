import 'package:beside04_test/domain/model/note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final Function(Note) noteDelete;
  final Function(Note) noteTap;

  const NoteWidget({
    Key? key,
    required this.note,
    required this.noteDelete,
    required this.noteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(note.timestamp);
    DateFormat format = DateFormat('yy/MM/dd HH:mm:ss');

    return InkWell(
      onTap: () async {
        await noteTap(note);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.amberAccent,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  note.emoticonUrl,
                  width: 30,
                  height: 30,
                ),
                Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              format.format(date),
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.black45,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              note.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.grey,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                          childAspectRatio: 2.5 / 1, //가로 세로 비율
                          mainAxisSpacing: 5, //수평 Padding
                          crossAxisSpacing: 5, //수직 Padding
                        ),
                        itemCount: note.emotion.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.deepPurple,
                            alignment: Alignment.center,
                            child: Text(
                              note.emotion[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        noteDelete(note);
                      },
                      icon: const Icon(Icons.delete_forever_rounded),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
