import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catcher/catcher.dart';
import 'package:catcher/core/catcher.dart';
import 'package:catcher/mode/silent_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';

final stringProvider =
    Provider.autoDispose.family<String, String>((ref, testString) {
  return testString;
});

void main() {
  var releaseOptions = CatcherOptions(
    SilentReportMode(),
    [ConsoleHandler()],
  );

  Catcher(ProviderScope(child: MyApp()), releaseConfig: releaseOptions);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      navigatorKey: Catcher.navigatorKey,
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final String string = watch(stringProvider("TEST STRING"));

    return Scaffold(
      body: Center(
        child: Text(string),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
