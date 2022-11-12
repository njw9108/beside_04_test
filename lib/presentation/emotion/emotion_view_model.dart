import 'package:get/get.dart';

class EmotionViewModel extends GetxController {
  final emoticonList = [
    'lib/res/img/star.png',
    'lib/res/img/thinking.png',
    'lib/res/img/squinting.png',
    'lib/res/img/disappoint.png',
    'lib/res/img/mask.png',
  ];
  final emotionList = [
    '즐거움',
    '슬픔',
    '화남',
    '우울함',
    '신남',
    '아픔',
  ];

  RxList<String> selectedEmotionList = <String>['즐거움'].obs;

  final Rx<String> _selectedEmoticon = 'lib/res/img/star.png'.obs;

  Rx<String> get selectEmoticon => _selectedEmoticon;

  void setEmoticon(String emoticon) {
    _selectedEmoticon(emoticon);
  }

    void selectEmotion(String emotion) {
    if (selectedEmotionList.contains(emotion)) {
      selectedEmotionList.remove(emotion);
    } else {
      selectedEmotionList.add(emotion);
    }
  }
}
