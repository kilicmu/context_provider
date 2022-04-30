import 'package:context_provider/provider.dart';
import 'package:flutter/material.dart';

class Consumer<T extends Provider> extends StatefulWidget {
  Consumer(
      {Key? key,
      required this.builder,
      required this.$provider,
      this.shouldLog = true})
      : super(key: key);
  Widget Function(T, BuildContext) builder;
  final T $provider;
  final bool shouldLog;
  Widget _composedBuilder(context) {
    return builder($provider, context);
  }

  @override
  State<Consumer> createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
  forceUpdate() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.$provider.addListener(forceUpdate);
  }

  @override
  void dispose() {
    widget.$provider.removeListener(forceUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget._composedBuilder(context);
  }
}
