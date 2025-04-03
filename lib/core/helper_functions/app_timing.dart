import 'dart:developer';

class AppTiming {
  Future<void> runFunAtX({
    required Function() action,
    required DateTime time,
  }) async {
    DateTime now = DateTime.now();
    log("${now.second + 5} = ${time.second}");
    await Future.delayed(time.difference(now), () {
      // log("Future Now come");
      action();
    });
  }
}
