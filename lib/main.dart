import 'package:counterstatemanagement/counter_model.dart';
import 'package:counterstatemanagement/counter_state_container.dart';
import 'package:counterstatemanagement/custom_test_widget.dart';
import 'package:counterstatemanagement/provider_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterModel counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderWidget(
        data: counterModel,
        child: Column(
          children: [
            CustomTestWidget(
              data: counterModel,
            ),
            FloatingActionButton(
              onPressed: () => counterModel.increment(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

// didValueChange() => setState(() {});
//
// @override
// Widget build(BuildContext context) {
//   CounterStateContainer.of(context).counter.addListener(didValueChange);
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(widget.title),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'You have pushed the button this many times:',
//           ),
//           CustomTestWidget(),
//           Text(
//             '${CounterStateContainer.of(context).counter.value}',
//             style: Theme.of(context).textTheme.display1,
//           ),
//         ],
//       ),
//     ),
//     floatingActionButton: Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         FloatingActionButton(
//           onPressed: () => CounterStateContainer.of(context).increment(),
//           tooltip: 'Increment',
//           child: Icon(Icons.add),
//         ),
//         SizedBox(
//           height: 16,
//         ),
//         FloatingActionButton(
//           onPressed: () => CounterStateContainer.of(context).decrement(),
//           tooltip: 'Decrement',
//           child: Icon(Icons.remove),
//         ),
//       ],
//     ),
//   );
// }
}
