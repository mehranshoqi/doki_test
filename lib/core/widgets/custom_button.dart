import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.bgColor,
    this.height = 48,
    this.loading = false,
    this.width,
  });
  final Function() onPressed;
  final String label;
  final bool loading;
  final double height;
  final double? width;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bgColor),
            elevation: MaterialStateProperty.all(0),
          ),
          onPressed: onPressed,
          child: loading
              ? const SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                )
              : Text(label),
        ),
      );
}
