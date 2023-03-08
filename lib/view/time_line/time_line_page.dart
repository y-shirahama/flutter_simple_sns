import 'package:flutter/material.dart';
import 'package:flutter_app/model/account.dart';
import 'package:flutter_app/model/post.dart';
import 'package:intl/intl.dart';


class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  Account myAccount = Account(
    id: '1',
    name: 'Flutterラボ',
    selfIntroduction: 'こんばんは',
    userId: 'flutter_lab',
    imagePath: 'https://avatars.githubusercontent.com/u/32825473?v=4',
    createdTime: DateTime.now(),
    updatedTime: DateTime.now()
  );

  List<Post> postList = [
    Post(
      id: '1',
      content: '記念カキコ',
      postAccountId: '1',
      createdTime: DateTime.now()
    ),
    Post(
        id: '2',
        content: '記念カキコ（2回目）',
        postAccountId: '1',
        createdTime: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('タイムライン', style: TextStyle(color: Colors.black),),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              CircleAvatar(
                radius: 22,
                foregroundImage: NetworkImage(myAccount.imagePath),
              ),
              Column(
                children: [
                  Text(myAccount.name),
                  Text(myAccount.userId),
                  Text(DateFormat('M/d/yy').format(postList[index].createdTime!))
                ],
              )
            ],
          );
        }),
    );
  }
}
