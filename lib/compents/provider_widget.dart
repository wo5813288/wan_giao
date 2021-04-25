import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/base_view_model.dart';

class ProviderWidget<T extends BaseViewModel> extends StatefulWidget {
  final T model;
  final Function(T model) onReadyMore;
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Widget child;
  ProviderWidget({this.model, this.onReadyMore,this.builder,this.child});

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends BaseViewModel> extends State<ProviderWidget<T>> {

  @override
  void initState() {
    super.initState();
    if (widget.onReadyMore != null) {
      widget.onReadyMore(widget.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
