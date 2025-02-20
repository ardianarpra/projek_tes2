import 'package:diskominfo/common/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTextBg extends StatelessWidget {
  BuildContext? context;
  String? title;
  double radius;
  double? width;
  EdgeInsetsGeometry? padding;
  String? hint;
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String?)? onchanged;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  BorderSide? focusBorderSide;
  BorderSide? enableBorderSide;
  FocusNode? focusNode;
  TextStyle? textStyleTitle;
  int? maxLength;
  int? maxLines;

  InputTextBg(
      {this.context,
      this.title,
      this.radius = 0,
      this.hint,
      this.width,
      this.padding,
      this.textStyleTitle,
      this.controller,
      Key? key,
      this.validator,
      this.onchanged,
      this.keyboardType,
      this.maxLength,
      this.maxLines,
      this.textInputAction,
      this.focusBorderSide,
      this.enableBorderSide,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(title ?? "",
                  style:
                      textStyleTitle ?? Theme.of(context).textTheme.bodySmall)
              : const SizedBox.shrink(),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(radius)),
            width: width,
            child: TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.primary),
                focusNode: focusNode,
                maxLines: maxLines,
                maxLength: maxLength,
                controller: controller,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                validator: validator,
                onChanged: onchanged,
                decoration: InputDecoration(
                  // counter: const Offstage(),
                  counterText: "",
                  contentPadding: const EdgeInsets.all(10),
                  hintText: hint!,
                  hintStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(
                    borderSide: focusBorderSide ??
                        const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: enableBorderSide ??
                        const BorderSide(color: Colors.transparent),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
