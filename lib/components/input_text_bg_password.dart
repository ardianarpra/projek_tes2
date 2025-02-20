import 'package:diskominfo/common/colors.dart';
import 'package:flutter/material.dart';

class InputTextBgPassword extends StatefulWidget {
  final BuildContext? context;
  final String? title;
  final double radius;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onchanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;
  final TextStyle? textTitleStyle;
  final bool readOnly;
  final void Function()? onTap;

  const InputTextBgPassword(
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
      this.textInputAction,
      this.autovalidateMode,
      this.focusNode,
      this.readOnly = false,
      this.onTap})
      : super(key: key);

  @override
  State<InputTextBgPassword> createState() => _InputTextBgPasswordState();
}

class _InputTextBgPasswordState extends State<InputTextBgPassword> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? Text(widget.title ?? "",
                  style: widget.textTitleStyle ??
                      const TextStyle(fontWeight: FontWeight.w800))
              : const SizedBox.shrink(),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            width: widget.width,
            child: TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
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
                decoration: InputDecoration(
                  counterText: "",
                  fillColor: AppColors.white,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 12),
                  hintText: widget.hint!,
                  hintStyle:
                      const TextStyle(fontSize: 14, color: AppColors.grey300),
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 16, minWidth: 16),
                  suffixIcon: InkWell(
                    onTap: () => {setSecure(secure)},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        !secure ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.primary.withOpacity(.6),
                      ),
                    ),
                  ),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(radius)),
                )),
          )
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
