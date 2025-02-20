import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTextReadOnly extends StatelessWidget {
  final BuildContext? context;
  final TextEditingController controller;
  final String? title;
  double radius;
  final String? hint;
  final Function()? onTap;
  void Function(String)? onChanged;
  String? Function(String?)? validation;

  InputTextReadOnly(
      {this.context,
      required this.controller,
      this.title,
      this.radius = 10,
      this.hint,
      this.onChanged,
      this.validation,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title!),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              onTap: onTap,
              controller: controller,
              readOnly: true,
              onChanged: onChanged,
              validator: validation,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: hint!,
                hintStyle: const TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius)),
              )),
        ],
      ),
    );
  }
}
