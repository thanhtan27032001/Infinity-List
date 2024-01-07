import 'package:flutter/material.dart';
import 'package:infinity_list/service/comment_service.dart';

class InfiniteList extends StatelessWidget {
  const InfiniteList({super.key});

  @override
  Widget build(BuildContext context) {
    CommentService.fetchCommentList();
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const ListTile(
              leading: Text('1'),
              title: Text('This is title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              subtitle: Text('This is subtitle'),
              isThreeLine: true,
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}