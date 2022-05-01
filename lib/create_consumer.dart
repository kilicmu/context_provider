part of only_store;

typedef ConsumerCreator<T extends Provider> = Consumer<T> Function(
    Widget Function(T, BuildContext));
ConsumerCreator<T> createConsumer<T extends Provider>(
    T provider, bool shouldLog) {
  provider.shouldLog = shouldLog;
  return (Widget Function(T, BuildContext) builder) {
    return Consumer<T>(builder: builder, $provider: provider);
  };
}
