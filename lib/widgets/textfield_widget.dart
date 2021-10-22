import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    String currentValue = textController.value.text;
    Color inputTextDecoColor = currentValue != ""
        ? AppColors.LoginInputHasValue
        : AppColors.LoginInputNoValue;
    Color iconTintColor =
        currentValue != "" ? Color(0xFF666666) : Color(0xFFFFFFFF);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: inputTextDecoColor,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: TextFormField(
              scrollPadding: EdgeInsets.only(bottom:40),
              controller: textController,
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
              autofocus: autoFocus,
              textInputAction: inputAction,
              obscureText: this.isObscure,
              maxLength: 25,
              keyboardType: this.inputType,
              style: Theme.of(context).textTheme.body1,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(2.0),
                  hintText: this.hint,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .body1!
                      .copyWith(color: hintColor),
                  counterText: '',
                  icon: this.isIcon
                      ? Icon(this.icon, color: iconTintColor)
                      : null,
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
