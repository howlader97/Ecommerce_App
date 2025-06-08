
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final dynamic maxLines;
  final bool isPassword;
  final Function? onTap;
  final Function? onChanged;
  final Function? onSubmit;
  final bool isMarginEnable;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autoValidateMode;
  final String? titleText;
  final bool showTitle;
  final bool isRequired;
  final String? labelText;
  final IconData? prefixIcon;
  final VoidCallback? onComplete;

  const CustomTextField({
    super.key,
    this.isPassword = false,
    this.hintText = '',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onTap,
    this.onChanged,
    this.onComplete,
    this.onSubmit,
    this.isMarginEnable = false,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.titleText,
    this.showTitle = true,
    this.isRequired = false,
    this.labelText,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? _obscureText : false,
      cursorColor: Colors.black,
      onEditingComplete: widget.onComplete,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle:
            robotoRegular.copyWith(color: AppColors.black.withOpacity(0.5)),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: AppColors.grey,
                width: .5
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: AppColors.grey,
              width: .5
            )
        ),
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: Icon(widget.prefixIcon, color: AppColors.black),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black),
                onPressed: _toggle,
              )
            : null,
      ),
      onTap: widget.onTap as void Function()?,
      onSaved: (text) => widget.nextFocus != null
          ? FocusScope.of(context).requestFocus(widget.nextFocus)
          : widget.onSubmit != null
              ? widget.onSubmit!(text)
              : null,
      onChanged: widget.onChanged as void Function(String)?,
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      borderSide: BorderSide(
        color: AppColors.red
      ),
    );
  }
}
