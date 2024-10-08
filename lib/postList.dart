import 'package:flutter/material.dart';
import 'post.dart';


class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback){
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(
          child: Row(
            children: [
              Expanded(
                  child: ListTile(
                    title: Text(post.body),
                    subtitle: Text(post.author),
                  )),
              Row(
                children: [
                  Container(
                    child: Text(post.likes.toString(),
                        style: TextStyle(fontSize: 20)),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                  IconButton(
                    onPressed: () => this.like(post.likePost), icon: Icon(Icons.thumb_up), color: post.userLiked ? Colors.green : Colors.black,)
                ],
              )
            ],
          ),
        );
      },
      itemCount: this.widget.listItems.length,
    );
  }
}