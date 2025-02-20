import 'package:diskominfo/common/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputText extends StatelessWidget {
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
  FocusNode? focusNode;
  int? maxLength;
  int? maxLines;
  bool? enabled;

  InputText(
      {this.context,
      this.title,
      this.radius = 10,
      this.hint,
      this.width,
      this.padding,
      this.controller,
      Key? key,
      this.validator,
      this.onchanged,
      this.keyboardType,
      this.maxLength,
      this.maxLines,
      this.enabled,
      this.textInputAction,
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
                  style: const TextStyle(fontWeight: FontWeight.w800))
              : const SizedBox.shrink(),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: width,
            child: TextFormField(
                enabled: enabled,
                focusNode: focusNode,
                maxLines: maxLines,
                maxLength: maxLength,
                controller: controller,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                validator: validator,
                onChanged: onchanged,
                decoration: InputDecoration(
                  focusedErrorBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.grey300, width: 2)),
                  errorStyle: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 12),
                  errorBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.grey300, width: 2)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.grey300, width: 2)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(.2),
                          width: 2)),
                  contentPadding: const EdgeInsets.only(bottom: 8),
                  hintText: hint!,
                  hintStyle: const TextStyle(fontSize: 12),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(radius)),
                )),
          )
        ],
      ),
    );
  }
}
