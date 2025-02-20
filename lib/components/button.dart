import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BuildContext? ctx;
  final double? fontSize;
  final String name;
  final Color colors;
  final Color? textColors;
  final double? width;
  final double? heigth;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final FontWeight? fontWeight;
  final Function()? onPressed;
  const Button(
      {this.ctx,
      required this.colors,
      this.textColors,
      required this.name,
      this.fontSize,
      this.heigth,
      this.width = double.infinity,
      this.margin,
      this.padding,
      this.onPressed,
      this.radius,
      this.fontWeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: heigth,
      child: ElevatedButton(
          onPressed: onPressed,
          child: FittedBox(
            child: Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          style:
              // ElevatedButton.styleFrom(
              //     primary: colors,
              //     textStyle:
              //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              //         ),
              ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(colors),
                  backgroundColor: MaterialStateProperty.all<Color>(colors),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 8),
                  )))),
    );
  }
}
