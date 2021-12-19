import 'package:firebase_database/firebase_database.dart';

class Memo{
  String? key;
  late String title;
  late String content;
  late String createTime;

  Memo(this.title, this.content, this.createTime);

  Memo.fromSnapshot(DataSnapshot snapshot)
    : key = snapshot.key,
      title = snapshot.value['title'],
      content = snapshot.value['content'],
      createTime = snapshot.value['createTime'];

  toJson() {
    return {
      'title': title,
      'content': content,
      'createTime': createTime,
    };
  }
}