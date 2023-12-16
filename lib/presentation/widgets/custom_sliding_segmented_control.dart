import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Example =>
/// CustomSlidingSegmentedControl<int>(
///   fromMax: true,
///   children: {
///     1: Text('Segmentation'),
///     2: Text('Max'),
///   },
///   thumbDecoration: BoxDecoration(
///     color: Colors.white,
///     boxShadow: [
///       BoxShadow(
///         color: Colors.black.withOpacity(.3),
///         blurRadius: 4.0,
///         spreadRadius: 1.0,
///         offset: Offset(
///           0.0,
///           2.0,
///         ),
///       ),
///     ],
///   ),
///   onValueChanged: (int value) {
///     print(value);
///   },
/// ),
/// ```
///
/// * `isStretch` - stretches CustomSlidingSegmentedControl to full width
/// * `onValueChanged` - on change current segment
/// * `children` - segment items map
/// * `initialValue` - initial segment
/// * `duration` - speed animation panel
/// * `curve` - curve for animated panel
/// * `innerPadding` - inner padding
/// * `fromMax` - gets the largest element, while the rest of the elements get its size
/// * `fixedWidth` - fixed width items
/// * `padding` - item padding
/// * `clipBehavior` - for container
/// * `decoration` - for decoration main panel
/// * `thumbDecoration` - for decoraton animation panel
/// * `height` - height panel
class CustomSlidingSegmentedControl<T> extends StatefulWidget {
  const CustomSlidingSegmentedControl({
    final Key? key,
    required this.children,
    required this.onValueChanged,
    this.initialValue,
    this.duration,
    this.curve = Curves.easeInOut,
    this.innerPadding = const EdgeInsets.all(2.0),
    this.padding = 12,
    this.fixedWidth,
    this.decoration = const BoxDecoration(color: CupertinoColors.systemGrey5),
    this.thumbDecoration = const BoxDecoration(color: Colors.white),
    this.isStretch = false,
    this.fromMax = false,
    this.clipBehavior = Clip.none,
    this.splashColor = Colors.transparent,
    this.splashFactory = NoSplash.splashFactory,
    this.highlightColor = Colors.transparent,
    this.height = 40,
    this.controller,
  })  : assert(children.length != 0),
        super(key: key);
  final BoxDecoration? decoration;
  final BoxDecoration? thumbDecoration;
  final ValueChanged<T> onValueChanged;
  final Duration? duration;
  final Curve curve;
  final EdgeInsets innerPadding;
  final double padding;
  final double? fixedWidth;
  final Map<T, Widget> children;
  final bool isStretch;
  final T? initialValue;
  final bool fromMax;
  final Clip clipBehavior;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final Color? highlightColor;
  final double? height;
  final CustomSegmentedController<T>? controller;

  @override
  CustomSlidingSegmentedControlState<T> createState() =>
      CustomSlidingSegmentedControlState();
}

class CustomSlidingSegmentedControlState<T>
    extends State<CustomSlidingSegmentedControl<T>> {
  T? current;
  double? height;
  double offset = 0.0;
  Map<T?, double> sizes = {};
  bool hasTouch = false;
  double? maxSize;
  List<Cache<T>> cacheItems = [];

  @override
  void initState() {
    widget.controller?.addListener(_controllerTap);
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_controllerTap);
    super.dispose();
  }

  @override
  void didUpdateWidget(
      covariant final CustomSlidingSegmentedControl<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final changeInitial = oldWidget.initialValue != widget.initialValue;

    final changeChildrenLength =
        oldWidget.children.length != widget.children.length;

    if (changeInitial || changeChildrenLength) {
      hasTouch = true;
      initialize(oldCurrent: current, isChangeInitial: changeInitial);
      for (final cache in cacheItems) {
        calculateSize(
          size: cache.size,
          item: cache.item,
          isCacheEnabled: false,
        );
      }
    }
  }

  void initialize({
    final T? oldCurrent,
    final bool isChangeInitial = false,
  }) {
    final List<T?> list = widget.children.keys.toList();
    final index = list.indexOf(widget.initialValue);
    final keys = list.toList();

    if (!isChangeInitial && oldCurrent != null) {
      current = oldCurrent;
    } else {
      if (widget.initialValue != null) {
        current = keys[index];
      } else {
        current = keys.first;
      }
    }
  }

  void calculateSize({
    required final Size size,
    required final MapEntry<T?, Widget> item,
    required final bool isCacheEnabled,
  }) {
    height ??= size.height;
    final Map<T?, double> temp = {};
    temp.putIfAbsent(item.key, () => widget.fixedWidth ?? size.width);
    final calculatedOffset = computeOffset<T>(
      current: current,
      items: widget.children.keys.toList(),
      sizes: sizes.values.toList(),
    );
    setState(() {
      offset = calculatedOffset;
      if (isCacheEnabled) {
        cacheItems.add(Cache<T>(item: item, size: size));
      }
      sizes = {...sizes, ...temp};
      if (widget.fromMax) {
        maxSize = sizes.values.toList().reduce(max);
      }
    });
  }

  void _controllerTap() {
    if (widget.controller!.value == null ||
        current == widget.controller!.value) {
      return;
    }

    final entry = widget.children.entries
        .where(
          (final element) => element.key == widget.controller!.value,
        )
        .toList();
    if (entry.isEmpty) {
      return;
    }

    onTapItem(entry.first);
  }

  void onTapItem(final MapEntry<T?, Widget> item) {
    if (!hasTouch) {
      setState(() => hasTouch = true);
    }
    setState(() => current = item.key);
    final List<T?> keys = widget.children.keys.toList();
    final calculatedOffset = computeOffset<T>(
      current: current,
      items: keys,
      sizes: sizes.values.toList(),
    );
    setState(() => offset = calculatedOffset);
    final value = keys[keys.indexOf(current)];
    if (value != null) {
      widget.onValueChanged(value);
    }
    widget.controller?.value = current;
  }

  Widget _segmentItem(final MapEntry<T, Widget> item) => InkWell(
        splashColor: widget.splashColor,
        splashFactory: widget.splashFactory,
        highlightColor: widget.highlightColor,
        onTap: () {
          onTapItem(item);
        },
        child: Container(
          height: widget.height,
          width: maxSize ?? widget.fixedWidth,
          padding: EdgeInsets.symmetric(horizontal: widget.padding),
          child: Center(child: item.value),
        ),
      );

  Widget layout() => OrientationBuilder(
        builder: (final BuildContext context, final Orientation orientation) =>
            Container(
          clipBehavior: widget.clipBehavior,
          decoration: widget.decoration,
          padding: widget.innerPadding,
          child: Stack(
            children: [
              AnimationPanel<T>(
                hasTouch: hasTouch,
                offset: offset,
                height: height,
                width: sizes[current],
                duration: widget.duration,
                curve: widget.curve,
                decoration: widget.thumbDecoration,
              ),
              Row(
                children: [
                  for (final item in widget.children.entries)
                    MeasureSize(
                      onChange: (final value) {
                        calculateSize(
                          size: value,
                          item: item,
                          isCacheEnabled: true,
                        );
                      },
                      child: widget.isStretch
                          ? Expanded(child: _segmentItem(item))
                          : _segmentItem(item),
                    ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.isStretch)
            Expanded(
              child: layout(),
            )
          else
            layout()
        ],
      );
}

class AnimationPanel<T> extends StatelessWidget {
  const AnimationPanel({
    final Key? key,
    required this.offset,
    required this.width,
    required this.height,
    required this.hasTouch,
    this.duration,
    this.curve,
    this.decoration,
  }) : super(key: key);

  final double offset;
  final double? width;
  final double? height;
  final Duration? duration;
  final Curve? curve;
  final bool hasTouch;
  final BoxDecoration? decoration;

  @override
  Widget build(final BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final calculatedOffset = isRtl ? offset * -1 : offset;

    return AnimatedContainer(
      transform: Matrix4.translationValues(calculatedOffset, 0, 0),
      duration: hasTouch == false
          ? Duration.zero
          : duration ?? const Duration(milliseconds: 200),
      curve: curve!,
      width: width,
      decoration: decoration,
      height: height,
    );
  }
}

class Cache<T> {
  Cache({
    required this.item,
    required this.size,
  });

  final MapEntry<T?, Widget> item;
  final Size size;
}

double computeOffset<T>({
  required final List<double> sizes,
  required final List<T?> items,
  final T? current,
}) {
  if (sizes.isNotEmpty) {
    return sizes.getRange(0, items.indexOf(current)).toList().fold<double>(
        0, (final previousValue, final element) => previousValue + element);
  } else {
    return 0;
  }
}

class CustomSegmentedController<T> extends ValueNotifier<T?> {
  CustomSegmentedController({final T? value}) : super(value);
}

class MeasureSize extends StatefulWidget {
  const MeasureSize({
    final Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Function(Size size) onChange;

  @override
  MeasureSizeState createState() => MeasureSizeState();
}

class MeasureSizeState extends State<MeasureSize> {
  @override
  Widget build(final BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  GlobalKey<State<StatefulWidget>> widgetKey = GlobalKey();
  Size? oldSize;

  void postFrameCallback(final Duration d) {
    final context = widgetKey.currentContext;
    if (context == null) return;

    final Size? newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize ?? Size.zero);
  }
}
