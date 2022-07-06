import 'package:flutter/material.dart';
import 'package:velowesalt/core/share_widgets/user_image.dart';

class UserItemWidget extends StatelessWidget {
  final String imageThumbnail;
  final String image;
  final String name;
  final int postCount;
  final int userId;
  final Function onItemClick;
  const UserItemWidget({
    Key? key,
    required this.imageThumbnail,
    required this.image,
    required this.name,
    required this.postCount,
    required this.userId,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemClick();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Hero(
                tag: image,
                child: UserImage(
                    url: imageThumbnail,
                    errorLatter: name.toUpperCase().substring(0, 1)),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: userId,
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.headline4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      postCount.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.arrow_right_rounded,
                size: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
