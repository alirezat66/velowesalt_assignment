import 'package:flutter/material.dart';

class PostItemWidget extends StatelessWidget {
  final String title;
  final String body;
  const PostItemWidget({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(body),
            )
          ],
        ),
      ),
    );
  }
}
