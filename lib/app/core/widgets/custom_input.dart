import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text_form_field.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController ec;
  final String hint;
  final FormFieldValidator<String>? validator;
  final FocusNode? focus;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? enabled;

  const CustomInput({
    super.key,
    required this.ec,
    required this.hint,
    this.validator,
    this.focus,
    this.inputFormatters,
    this.keyboardType,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: CustomTextFormField(
        enabled: enabled,
        myFocus: focus,
        controller: ec,
        showIcon: false,
        validator: validator,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        hint: hint,
        onChange: (value) {},
      ),
    );
  }
}
