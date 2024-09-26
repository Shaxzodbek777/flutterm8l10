
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/postmodile.dart';
import '../pages/updatepage.dart';
import '../viewModel/h_v_m.dart';

Widget itemOfPost(BuildContext context, HomeViewModel viewModel, Post post) {
  return Slidable(
    endActionPane: const SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            post.title.toUpperCase(),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5,),

          // Body
          Text(post.body),
        ],
      ),
    ),
    actions: [
      IconSlideAction(
        caption: 'Edit',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(post: post)));
        },
      ),
    ],

    secondaryActions: [
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          viewModel.apiPostDelete(post).then((value) {
            if (value) viewModel.apiPostList();
          });
        },
      ),
    ],
  );
}