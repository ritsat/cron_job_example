import 'package:cron/cron.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cron = Cron();

  ScheduledTask? scheduledTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cron Job Example"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: scheduleTask, child: const Text("Schedule")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(onPressed: cancelTask, child: const Text("Cancel"))
            ],
          ),
        ));
  }

  void scheduleTask() async {
    scheduledTask = cron.schedule(Schedule.parse("* */1 * * * *"), () async {
      print("Executing task : " + DateTime.now().toString());
    });
  }

  void cancelTask() {
    scheduledTask!.cancel();
  }
}
