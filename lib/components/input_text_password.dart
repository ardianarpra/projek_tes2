import 'package:diskominfo/common/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTextPassword extends StatefulWidget {
  final BuildContext? context;
  final String? title;
  final String? hint;
  TextEditingController? controller;
  EdgeInsetsGeometry? padding;
  bool? secure;
  String? Function(String?)? validator;
  void Function(String?)? onchanged;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;

  InputTextPassword(
      {this.context,
      this.title,
      this.hint,
      this.controller,
      this.padding,
      this.secure,
      this.validator,
      this.onchanged,
      this.keyboardType,
      this.textInputAction,
      Key? key})
      : super(key: key);

  @override
  _InputTextPasswordState createState() => _InputTextPasswordState();
}

class _InputTextPasswordState extends State<InputTextPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title!,
              style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
              onChanged: widget.onchanged,
              controller: widget.controller,
              validator: widget.validator,
              obscureText: widget.secure!,
              decoration: InputDecoration(
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey300, width: 2)),
                errorStyle:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey300, width: 2)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey300, width: 2)),
                suffixIcon: IconButton(
                    onPressed: () => {setSecure(widget.secure)},
                    icon: Icon(
                      !widget.secure! ? Icons.visibility : Icons.visibility_off,
                    )),
                contentPadding: const EdgeInsets.all(10),
                hintText: widget.hint!,
                hintStyle: const TextStyle(fontSize: 14),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10))
              ))
        ],
      ),
    );
  }

  setSecure(sec) {
    setState(() {
      widget.secure = !widget.secure!;
    });
  }
}
