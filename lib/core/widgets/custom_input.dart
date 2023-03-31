import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    this.placeholder = '',
    this.validator,
    this.controller,
  }) : super(key: key);
  final String placeholder;
  final String? Function(String? t)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            label: Text(placeholder),
            filled: true,
            counterText: '',
            disabledBorder: _baseBorderStyle(),
            enabledBorder: _baseBorderStyle(),
            focusedBorder: _baseBorderStyle(),
            errorBorder: _baseBorderStyle(error: true),
            focusedErrorBorder: _baseBorderStyle(error: true),
            fillColor: Colors.grey.shade100,
            hintText: placeholder,
          ),
          textAlign: TextAlign.center,
        ),
      );
}

OutlineInputBorder _baseBorderStyle({bool error = false}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
      borderSide: BorderSide(
        color: error ? Colors.red : Colors.grey,
        width: 1.2,
      ),
    );
