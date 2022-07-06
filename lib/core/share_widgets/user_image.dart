import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final double size;
  final String url;
  final String errorLatter;
  const UserImage(
      {Key? key, this.size = 72, required this.url, required this.errorLatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(72),
      child: CachedNetworkImage(
        imageUrl: url,
        width: 72,
        height: 72,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Container(
          color: Theme.of(context).colorScheme.primary,
          width: 72,
          height: 72,
          child: Center(
              child: Text(
            errorLatter,
            style: Theme.of(context).textTheme.headline3,
          )),
        ),
      ),
    );
  }
}
