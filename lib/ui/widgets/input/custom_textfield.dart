import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_sizedbox.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Iterable<String>? autofillHints;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final Color? textColor;
  final String? hintText;
  final bool autoFocus;
  final bool isPasswordTextField;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? prefixText;
  final bool? enabled;
  final String? initialValue;
  final Color? fillColor;
  final bool? autocorrect;
  final TextCapitalization? textCapitalization;
  final bool readOnly;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? prefixStyle;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final Widget? counter;
  final Widget? suffixIcon;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? helperText;
  final VoidCallback? onEditingComplete;
  final BorderRadius? borderRadius;
  final bool filled;
  final int? hintMaxLines;
  final double? height;
  final Color? borderColor;

  const CustomTextField({
    super.key,
    this.controller,
    this.readOnly = false,
    this.autofillHints,
    this.onTap,
    this.onChanged,
    this.autovalidateMode,
    this.textColor,
    this.hintText,
    this.autoFocus = false,
    this.onSaved,
    this.onFieldSubmitted,
    this.isPasswordTextField = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.prefixIcon,
    this.labelText,
    this.floatingLabelBehavior,
    this.prefixText,
    this.validator,
    this.enabled,
    this.initialValue,
    this.fillColor,
    this.autocorrect = true,
    this.textCapitalization,
    this.obscureText = false,
    this.maxLength,
    this.maxLines,
    this.prefixStyle,
    this.decoration,
    this.focusNode,
    this.counter,
    this.suffixIcon,
    this.style,
    this.helperText,
    this.onEditingComplete,
    this.borderRadius,
    this.filled = false,
    this.hintMaxLines,
    this.hintStyle,
    this.labelStyle,
    this.height,
    this.borderColor,
  });

  const CustomTextField.password({
    super.key,
    this.controller,
    this.onChanged,
    this.autofillHints,
    this.onTap,
    this.readOnly = false,
    this.autovalidateMode,
    this.prefixIcon,
    this.textColor,
    this.hintText,
    this.autoFocus = false,
    this.floatingLabelBehavior,
    this.isPasswordTextField = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.onSaved,
    this.onFieldSubmitted,
    this.labelText,
    this.prefixText,
    this.validator,
    this.enabled,
    this.initialValue,
    this.fillColor,
    this.autocorrect = false,
    this.textCapitalization,
    this.obscureText = true,
    this.maxLength,
    this.maxLines = 1,
    this.prefixStyle,
    this.decoration,
    this.focusNode,
    this.counter,
    this.suffixIcon,
    this.style,
    this.helperText,
    this.onEditingComplete,
    this.borderRadius,
    this.filled = false,
    this.hintMaxLines,
    this.hintStyle,
    this.labelStyle,
    this.height,
    this.borderColor,
  });

  const CustomTextField.filled({
    super.key,
    this.controller,
    this.onChanged,
    this.autofillHints,
    this.onTap,
    this.readOnly = false,
    this.autovalidateMode,
    this.prefixIcon,
    this.textColor,
    this.hintText,
    this.autoFocus = false,
    this.floatingLabelBehavior,
    this.isPasswordTextField = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.onSaved,
    this.onFieldSubmitted,
    this.labelText,
    this.prefixText,
    this.validator,
    this.enabled,
    this.initialValue,
    this.fillColor,
    this.autocorrect = false,
    this.textCapitalization,
    this.obscureText = false,
    this.maxLength,
    this.maxLines = 1,
    this.prefixStyle,
    this.decoration,
    this.focusNode,
    this.counter,
    this.suffixIcon,
    this.style,
    this.helperText,
    this.onEditingComplete,
    this.borderRadius,
    this.filled = true,
    this.hintMaxLines,
    this.hintStyle,
    this.labelStyle,
    this.height,
    this.borderColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  InputDecoration get _filledDecoration => InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        focusedBorder: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: widget.borderRadius ?? k12pxBorderRadius,
          borderSide:
              BorderSide(width: 1, color: widget.borderColor ?? kPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: widget.borderRadius ?? k12pxBorderRadius,
          borderSide:
              BorderSide(width: 1, color: widget.borderColor ?? kPrimaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: widget.borderRadius ?? k12pxBorderRadius,
          borderSide:
              BorderSide(width: 1, color: widget.borderColor ?? kPrimaryColor),
        ),
      );

  InputDecoration get _underlineDecoration => const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: kGreyD9),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kGreyD9),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PaddedColumn(
      children: [
        if (widget.filled == false)
          ResponsiveText.w400(
            widget.labelText ?? '',
            color: kGrey70,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        // if (widget.filled == false) verticalSpaceCustom(8),
        ResponsiveSizedBox(
          height: widget.height,
          child: TextFormField(
            textInputAction: widget.textInputAction,
            obscureText: _obscureText,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            autofocus: widget.autoFocus,
            enabled: widget.enabled,
            onTap: widget.onTap,
            initialValue: widget.initialValue,
            keyboardType: widget.keyboardType,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.sentences,
            cursorColor: kPrimaryColor,
            controller: widget.controller,
            style: kLato400Responsive(16),
            decoration:
                (widget.filled ? _filledDecoration : _underlineDecoration)
                    .copyWith(
              prefixIcon: widget.prefixIcon,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  kLato400Responsive(16).copyWith(color: kGrey70),
              hintMaxLines: widget.hintMaxLines,
              suffixIcon: widget.isPasswordTextField
                  ? GestureDetector(
                      onTap: _toggleObscure,
                      child: _obscureText
                          ? const Icon(Icons.visibility_rounded,
                              color: kPrimaryColor)
                          : const Icon(Icons.visibility_off_rounded,
                              color: kPrimaryColor),
                    )
                  : widget.suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
