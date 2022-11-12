import 'package:beside04_test/di/getx_binding_builder_call_back.dart';
import 'package:beside04_test/domain/model/note.dart';
import 'package:beside04_test/presentation/emotion/emotion_view_model.dart';
import 'package:beside04_test/presentation/note_edit/note_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmotionScreen extends GetView<EmotionViewModel> {
  const EmotionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('감정 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: controller.emoticonList
                    .map((emoticon) => InkWell(
                          onTap: () {
                            controller.setEmoticon(emoticon);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.all(10),
                            width: 40,
                            height: 40,
                            child: Image.asset(emoticon),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.all(10),
                width: 100,
                height: 100,
                child: Obx(
                  () => Image.asset(
                    controller.selectEmoticon.value,
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.emotionList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        controller.selectEmotion(controller.emotionList[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          controller.emotionList[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              height: 140,
              child: Obx(
                () => GridView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: controller.selectedEmotionList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                    childAspectRatio: 2.5 / 1, //가로 세로 비율
                    mainAxisSpacing: 10, //수평 Padding
                    crossAxisSpacing: 10, //수직 Padding
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(),
                            Text(controller.selectedEmotionList[index]),
                            IconButton(
                              onPressed: () {
                                controller.selectEmotion(
                                    controller.selectedEmotionList[index]);
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 15,
              ),
              child: InkWell(
                onTap: () {
                  Get.to(
                    NoteEditScreen(
                      note: Note(
                        title: '',
                        content: '',
                        timestamp: 0,
                        emotion: controller.selectedEmotionList,
                        emoticonUrl: controller.selectEmoticon.value,
                      ),
                    ),
                    binding: BindingsBuilder(getNoteEditBinding),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '글쓰러 가기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
