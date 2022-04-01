import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPageRoute<T> extends PageRoute<T>{

  HeroPageRoute(
  {required WidgetBuilder builder, RouteSettings? settings,
    bool fullscreenDialog = false,}) : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;
  @override
  Color? get barrierColor => Colors.black38;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  String? get barrierLabel => "Popup open";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  bool get maintainState => true;


}