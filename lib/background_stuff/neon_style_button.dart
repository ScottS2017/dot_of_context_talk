import 'package:flutter/material.dart';

class NeonStyleButton extends StatelessWidget {
  /// Creates an instance of [NeonStyleButton].
  const NeonStyleButton({
    Key? key,
    required this.backgroundIsDark,
    required this.shadowSize,
    required this.text,
    required this.color,
    required this.callback,
  }) : super(key: key);

  /// The size of the "glow", which is actually a shadow.
  final double shadowSize;

  /// The text to display in the button.
  final String text;

  /// The base color for the button.
  final Color color;

  /// Whether or not to render the button on a black background.
  final bool backgroundIsDark;

  /// The callback to be invoked upon pressing the button.
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      radius: 16.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundIsDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: shadowSize,
                spreadRadius: shadowSize,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
