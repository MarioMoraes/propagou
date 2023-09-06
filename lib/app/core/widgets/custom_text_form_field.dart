import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color_constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final bool showIcon;
  final void Function(String) onChange;
  final FocusNode? myFocus;
  final List<TextInputFormatter>? inputFormatters;

  CustomTextFormField(
      {Key? key,
      required this.hint,
      this.obscureText = false,
      this.controller,
      this.validator,
      this.icon,
      this.showIcon = false,
      required this.onChange,
      this.myFocus,
      this.inputFormatters})
      : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          onFieldSubmitted: (value) => onChange(value),
          focusNode: myFocus,
          controller: controller,
          validator: validator,
          inputFormatters: inputFormatters,
          obscureText: obscureTextVNValue,
          decoration: InputDecoration(
              filled: true,
              fillColor: ColorConstants.background.withOpacity(0.5),
              isDense: true,
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w300,
                fontSize: 14.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: ColorConstants.primary),
                borderRadius: BorderRadius.circular(5),
              ),
              prefixIcon: showIcon ? Icon(icon, size: 25) : null,
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon: Icon(
                        obscureTextVNValue ? Icons.lock : Icons.lock_open,
                        color: Colors.black,
                      ),
                    )
                  : null),
        );
      },
    );
  }
}
