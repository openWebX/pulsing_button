library pulsing_button;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

export 'package:pulsing_button/pulsing_button.dart';

class PulsingButton extends StatefulWidget {
  final VoidCallback? onPressed, onLongPress;
  final ValueChanged<bool>? onHighLightChanged;
  final MouseCursor? mouseCursor;
  final TextStyle? textStyle;
  final Color? fillColor, hoverColor, focusColor, highlightColor, splashColor;
  final double elevation, hoverElevation, focusElevation, highlightElevation, disabledElevation;
  final EdgeInsetsGeometry padding;
  final VisualDensity visualDensity;
  final BoxConstraints constraints;
  final ShapeBorder shape;
  final Widget? child;
  final MaterialTapTargetSize materialTapTargetSize;
  final FocusNode? focusNode;
  final Duration animationDuration;
  final bool autofocus;
  final Clip clipBehavior;
  final bool enableFeedback;

  const PulsingButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.onHighLightChanged,
    this.mouseCursor,
    this.textStyle,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.elevation = 2.0,
    this.hoverElevation = 4.0,
    this.focusElevation = 4.0,
    this.highlightElevation = 8.0,
    this.disabledElevation = 0.0,
    this.padding = EdgeInsets.zero,
    this.visualDensity = VisualDensity.standard,
    this.constraints = const BoxConstraints(minWidth: 88.0, minHeight: 88.0, maxWidth: 88, maxHeight: 88),
    this.shape = const CircleBorder(side: BorderSide.none),
    this.animationDuration = const Duration(milliseconds: 1000),
    MaterialTapTargetSize? materialTapTargetSize,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.enableFeedback = true,
    this.child,
  })  : materialTapTargetSize = materialTapTargetSize ?? MaterialTapTargetSize.padded,
        assert(shape != null),
        assert(elevation != null && focusElevation != null && disabledElevation != null && hoverElevation != null && highlightElevation != null),
        assert(elevation >= 0.0 && focusElevation >= 0.0 && disabledElevation >= 0.0 && hoverElevation >= 0.0 && highlightElevation >= 0.0),
        assert(padding != null),
        assert(constraints != null),
        assert(animationDuration != null),
        assert(clipBehavior != null),
        assert(autofocus != null),
        super(key: key);

  @override
  _PulsingButtonState createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<PulsingButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _sizeAnimation;
  double _sizeMultiplier = 1.0;
  double _sizeEps = 0.05;

  late Animation<double> _elevationAnimation;
  double _elevationMultiplier = 1.0;
  double _elevationEps = 0.1;

  @override
  void initState() {
    _controller = AnimationController(vsync: this)
      ..addListener(() => setState(() {
            _sizeMultiplier = _sizeAnimation.value;
            _elevationMultiplier = _elevationAnimation.value;
          }))
      ..duration = widget.animationDuration;

    _sizeAnimation = Tween<double>(begin: _sizeMultiplier, end: _sizeMultiplier + _sizeEps)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCirc, reverseCurve: Curves.easeOutCirc));
    _elevationAnimation = Tween<double>(begin: _elevationMultiplier, end: _elevationMultiplier + _elevationEps)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCirc, reverseCurve: Curves.easeOutCirc));

    _controller.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      onHighlightChanged: widget.onHighLightChanged,
      mouseCursor: widget.mouseCursor,
      textStyle: widget.textStyle,
      fillColor: widget.fillColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      splashColor: widget.splashColor,
      elevation: widget.elevation * _elevationMultiplier,
      focusElevation: widget.focusElevation,
      hoverElevation: widget.hoverElevation,
      highlightElevation: widget.highlightElevation,
      disabledElevation: widget.disabledElevation,
      padding: widget.padding,
      visualDensity: widget.visualDensity,
      constraints: widget.constraints * _sizeMultiplier,
      shape: widget.shape,
      animationDuration: kThemeChangeDuration,
      clipBehavior: widget.clipBehavior,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      materialTapTargetSize: widget.materialTapTargetSize,
      child: widget.child,
      enableFeedback: widget.enableFeedback,
    );
  }
}
