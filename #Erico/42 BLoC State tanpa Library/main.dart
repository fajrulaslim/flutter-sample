import 'package:belajar/color_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_light_blue);
              },
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('BLoC tanpa Library'),
        ),
        body: Center(
            child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.amber,
          builder: (context, snapshot) {
            return AnimatedContainer(
              width: 100,
              height: 100,
              color: snapshot.data,
              duration: Duration(microseconds: 500),
            );
          },
        )),
      ),
    );
  }
}