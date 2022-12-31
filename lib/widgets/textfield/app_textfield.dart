import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    Key? key,
    required this.hint,
    this.obscurable = false,
  }) : super(key: key);

  final String hint;
  final bool obscurable;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: widget.obscurable ? renderSuffix : null,
      ),
      obscureText: widget.obscurable ? obscured : false,
    );
  }

  get renderSuffix => IconButton(
        onPressed: () {
          setState(() => obscured = !obscured);
        },
        icon: obscured
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      );
}
