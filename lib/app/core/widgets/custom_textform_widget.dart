import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycaliana_dvt/app/core/theme/app_color.dart' show AppColors;

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool? enabled;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function()? onTapOutside;
  final String? prefixText;
  final String? suffixText;
  final String? initialValue;
  final String? helperText;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextForm({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText,
    this.maxLines,
    this.suffixIcon,
    this.enabled,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.onTapOutside,
    this.prefixText,
    this.suffixText,
    this.initialValue,
    this.helperText,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 14, color: AppColors.primary),
      enabled: enabled ?? true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      scrollPadding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height),
      cursorColor: AppColors.primary,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 14),
        suffixIcon: suffixIcon,
        prefixIconColor: AppColors.primary,
        suffixIconColor: Colors.grey[400],
        fillColor: Colors.transparent,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        hintText: hintText,
        prefixIcon:
            prefixIcon != null
                ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
                  child: prefixIcon,
                )
                : null,
      ),
      validator: validator,
    );
  }
}
