
import 'package:diskominfo/common/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTextStyle extends StatelessWidget {
  BuildContext? context;
  String? title;
  double radius;
  double? width;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  String? hint;
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String?)? onchanged;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  AutovalidateMode? autovalidateMode;
  FocusNode? focusNode;
  int? maxLength;
  int? maxLines;
  bool? enabled;
  TextStyle? textTitleStyle;
  TextStyle? fillTextStyle;
  bool readOnly;
  void Function()? onTap;

  InputTextStyle(
      {this.context,
      this.margin,
      this.title,
      this.radius = 10,
      required this.hint,
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
      this.textTitleStyle,
      this.fillTextStyle,
      this.textInputAction,
      this.autovalidateMode,
      this.focusNode,
      this.readOnly = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title ?? "",
                        style: textTitleStyle ??
                            const TextStyle(fontWeight: FontWeight.w800)),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          TextFormField(
              style: fillTextStyle ?? Theme.of(context).textTheme.bodySmall,
              onTap: onTap,
              readOnly: readOnly,
              autovalidateMode: autovalidateMode,
              enabled: enabled,
              focusNode: focusNode,
              maxLines: maxLines,
              maxLength: maxLength,
              controller: controller,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              validator: validator,
              onChanged: onchanged,
              // enableSuggestions: true,
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                filled: true,
                fillColor: AppColors.white,
                focusedErrorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        color: AppColors.colorDanger, width: 2)),
                errorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        color: AppColors.colorDanger, width: 2)),
                errorStyle:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                // errorBorder: const UnderlineInputBorder(
                //     borderSide:
                //         BorderSide(color: AppColors.grey300, width: 2)),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: AppColors.grey300,
                      width: 2,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: AppColors.primary.withOpacity(.5), width: 2)),
                contentPadding: const EdgeInsets.all(8),
                hintText: hint!,
                hintStyle: const TextStyle(fontSize: 12),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(radius)),
              )),
        ],
      ),
    );
  }
}
