import 'package:flutter/material.dart';

abstract class MaterialPageResultSink<T> {
  void emit(T result);
}

class _MaterialPageResultSource<T> implements MaterialPageResultSink<T> {
  T? _result;

  @override
  void emit(T result) {
    _result = result;
  }
}

typedef ResultPropagationWidgetBuilder<T> = Widget Function(
  BuildContext context,
  MaterialPageResultSink<T> resultSink,
);

class MaterialPageResultPropagationRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  MaterialPageResultPropagationRoute({required this.builder});

  final ResultPropagationWidgetBuilder<T> builder;
  late _MaterialPageResultSource<T> _resultSource;

  @override
  Widget buildContent(BuildContext context) {
    _resultSource = _MaterialPageResultSource();
    return builder(context, _resultSource);
  }

  @override
  bool didPop(T? result) {
    return super.didPop(_resultSource._result);
  }

  @override
  bool get maintainState => true;
}
