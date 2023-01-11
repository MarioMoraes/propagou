import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final bool showIcon;
  final void Function(String) onChange;

  CustomTextFormField({
    Key? key,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.icon,
    this.showIcon = false,
    required this.onChange,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return Expanded(
          child: TextFormField(
            onFieldSubmitted: (value) => onChange(value),
            controller: controller,
            validator: validator,
            obscureText: obscureTextVNValue,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                isDense: true,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
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
          ),
        );
      },
    );
  }
}
