import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'memo.dart';
import 'memoAdd.dart';
import 'memoDetail.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({Key? key}) : super(key: key);

  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  FirebaseDatabase? _database;
  DatabaseReference? reference;
  String _databaseURL = 'https://memo-db-2042b-default-rtdb.firebaseio.com/';
  List<Memo> memos = new List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database!.reference().child('memo');

    reference!.onChildAdded.listen((event) {
      print(event.snapshot.value.toString());

      setState(() {
        memos.add(Memo.fromSnapshot(event.snapshot));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메모 앱"),
      ),
      body: Container(
        child: Center(
          child: memos.length == 0
              ? CircularProgressIndicator()
              : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index){
                return Card(
                  child: GridTile(
                    child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: SizedBox(
                        child: GestureDetector(
                          onTap: () async {
                            Memo? memo = await Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) =>
                                  MemoDetailPage(
                                    reference!, memos[index]
                                  )
                              )
                            );
                            if (memo != null){
                              setState(() {
                                memos[index].title = memo.title;
                                memos[index].content = memo.content;
                              });
                            }
                          },

                          onLongPress: (){
                            showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text(memos[index].title),
                                  content: Text('삭제하시겠습니까?'),
                                  actions: [
                                    TextButton(
                                      onPressed: (){
                                        reference!
                                            .child(memos[index].key!)
                                            .remove()
                                            .then((_){
                                          setState((){
                                            memos.removeAt(index);
                                            Navigator.of(context).pop();
                                          });
                                        });
                                      },
                                      child: Text('예'),
                                    ),
                                  ],
                                );
                              }
                            );
                          },
                          child: Text(memos[index].content),
                        ),
                      ),
                    ),
                    header: Text(memos[index].title),
                    footer: Text(memos[index].createTime.substring(0, 10)),
                  ),
                );
              },
            itemCount: memos.length,
          )
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MemoAddPage(reference!)));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
