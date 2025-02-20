import 'package:diskominfo/common/colors.dart';
import 'package:flutter/material.dart';

class InputTextStylePassword extends StatefulWidget {
  BuildContext? context;
  String? title;
  double? radius;
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
  bool? enabled;
  TextStyle? textTitleStyle;
  TextStyle? fillTextStyle;
  bool readOnly;
  void Function()? onTap;

  InputTextStylePassword(
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
  State<InputTextStylePassword> createState() => _InputTextStylePasswordState();
}

class _InputTextStylePasswordState extends State<InputTextStylePassword> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title ?? "",
                        style: widget.textTitleStyle ??
                            const TextStyle(fontWeight: FontWeight.w800)),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          TextFormField(
              style:
                  widget.fillTextStyle ?? Theme.of(context).textTheme.bodySmall,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              autovalidateMode: widget.autovalidateMode,
              enabled: widget.enabled,
              focusNode: widget.focusNode,
              obscureText: secure,
              maxLength: widget.maxLength,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              validator: widget.validator,
              onChanged: widget.onchanged,
              // enableSuggestions: true,
              decoration: InputDecoration(
                counterText: "",
                errorMaxLines: 2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                filled: true,
                fillColor: AppColors.white,
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 16, minWidth: 16),
                suffixIcon: InkWell(
                  onTap: () => {setSecure(secure)},
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        !secure ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.primary.withOpacity(.6),
                      )),
                ),
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
                    borderSide: BorderSide(
                        color: AppColors.primary.withOpacity(.5), width: 2)),
                contentPadding: const EdgeInsets.all(8),
                hintText: widget.hint!,
                hintStyle: const TextStyle(fontSize: 12),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(radius)),
              )),
        ],
      ),
    );
  }

  setSecure(sec) {
    setState(() {
      secure = !sec;
    });
  }
}
