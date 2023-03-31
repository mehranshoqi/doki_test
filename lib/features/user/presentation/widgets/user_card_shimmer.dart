import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserCardShimmer extends StatelessWidget {
  const UserCardShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade300,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: _cardDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 24),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textShimmer(),
                      const SizedBox(height: 6),
                      _textShimmer(140),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _textShimmer(190)
            ],
          ),
        ),
      );

  BoxDecoration _cardDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey,width: 1.5),
      );

  Widget _textShimmer([double width = 80]) => Container(
        width: width,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.grey.shade100,
        ),
      );
}
