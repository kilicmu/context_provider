library context_provider;

import 'package:flutter/foundation.dart';

class Provider extends ChangeNotifier {
  Provider({
    Key? key,
  });
  List<String> snapshots = [];
  bool shouldLog = true;
  _toLogState(String action) {
    final length = snapshots.length;
    final snapshot = toString();
    if (length > 0) {
      if (kDebugMode && shouldLog) {
        print("action: $action, old: ${snapshots[length - 1]}, new: $snapshot");
      }
    }
    snapshots.add(snapshot);
  }

  inspectAction(String str) {
    str = str.substring(str.indexOf("#1"), str.indexOf("#2"));
    final result = RegExp(r"#1\ +(\w+.\w+).").firstMatch(str);
    return result?.group(1) ?? "unknown action";
  }

  void $notify() {
    final action = inspectAction(StackTrace.current.toString());
    _toLogState(action);
    notifyListeners();
  }
}
