import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController ec;
  final String hint;
  final FormFieldValidator<String>? validator;
  final FocusNode? focus;

  const CustomInput({
    super.key,
    required this.ec,
    required this.hint,
    this.validator,
    this.focus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: CustomTextFormField(
        myFocus: focus,
        controller: ec,
        showIcon: false,
        validator: validator,
        hint: hint,
        onChange: (value) {},
      ),
    );
  }
}
