import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarUrlImage extends StatelessWidget {
  final String? imageUrl;

  const AvatarUrlImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return const Icon(Icons.person);
    }
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl!), fit: BoxFit.cover)),
    );
  }
}
