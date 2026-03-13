import 'package:flutter/material.dart';

class ButtonWithLoadingIndicator extends StatefulWidget {
  const ButtonWithLoadingIndicator({
    super.key,
    required this.onPressed,
    required this.title,
    required this.status,
    this.icon,
    this.size = .normal,
  });
  final String title;
  final ButtonWithLoadingIndicatorStatus status;
  final ButtonWithLoadingIndicatorSizes size;
  final VoidCallback onPressed;
  final Icon? icon;
  @override
  State<ButtonWithLoadingIndicator> createState() =>
      _ButtonWithLoadingIndicatorState();
}

class _ButtonWithLoadingIndicatorState
    extends State<ButtonWithLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    double fontSize = switch (widget.size) {
      .extraSmall => 15,
      ButtonWithLoadingIndicatorSizes.small => 20,
      ButtonWithLoadingIndicatorSizes.normal => 24,
      .big => 30,
    };
    double iconSize = switch (widget.size) {
      .extraSmall => 15,
      ButtonWithLoadingIndicatorSizes.small => 20,
      ButtonWithLoadingIndicatorSizes.normal => 24,
      .big => 30,
    };
    double strockeWidth = switch (widget.size) {
      .extraSmall => 1.5,
      ButtonWithLoadingIndicatorSizes.small => 2,
      ButtonWithLoadingIndicatorSizes.normal => 3,
      .big => 3.5,
    };
    double buttonHeight = switch (widget.size) {
      .extraSmall => 25,
      ButtonWithLoadingIndicatorSizes.small => 40,
      ButtonWithLoadingIndicatorSizes.normal => 50,
      .big => 65,
    };
    double padding = switch (widget.size) {
      ButtonWithLoadingIndicatorSizes.extraSmall => 10,
      ButtonWithLoadingIndicatorSizes.small => 12,
      ButtonWithLoadingIndicatorSizes.normal => 15,
      .big => 20,
    };
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.status == .text ? Colors.white : Colors.white54,
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: fontSize, fontFamily: "Architexture"),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonHeight / 2),
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: Size.fromHeight(buttonHeight),
      ),
      child: AnimatedSize(
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: Durations.short4,
        child: switch (widget.status) {
          .loading => SizedBox.square(
            dimension: buttonHeight,
            child: Padding(
              padding: EdgeInsets.all(buttonHeight * 0.3),
              child: CircularProgressIndicator(
                strokeWidth: strockeWidth,
                color: ColorScheme.of(context).surface,
              ),
            ),
          ),
          .text => Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.title),
                if (widget.icon != null) ...[
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, size: iconSize),
                ],
              ],
            ),
          ),
        },
      ),
    );
  }
}

enum ButtonWithLoadingIndicatorStatus { text, loading }

enum ButtonWithLoadingIndicatorSizes { small, normal, extraSmall, big }
