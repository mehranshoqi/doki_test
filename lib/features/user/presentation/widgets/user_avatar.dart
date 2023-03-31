import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.imageUrl, this.onTap});
  final String? imageUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: 36,
        child: InkWell(
          onTap: onTap,
          child: ClipRRect(
            child: imageUrl != null
                ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  )
                : const Icon(
                    Icons.account_circle_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
      );
}
