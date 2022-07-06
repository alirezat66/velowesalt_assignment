import 'package:flutter/material.dart';
import 'package:velowesalt/core/util/constants/images.dart';

class LoadingWidget extends StatelessWidget {
  final double opacity;
  final bool isFullScreen;
  const LoadingWidget({
    Key? key,
    this.opacity = 1,
    this.isFullScreen = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background.withOpacity(opacity),
      height: isFullScreen ? MediaQuery.of(context).size.height : null,
      child: Center(
        child: Image.asset(gifLoading),
      ),
    );
  }
}
