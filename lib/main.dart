
import 'package:counterstatemanagement/counter_model.dart';
import 'package:counterstatemanagement/custom_test_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  BuildContext mContext;

  final String title;

  _testReadPro(){
    // 仅仅读数据不会引发builder.
    int value = mContext.read<CounterModel>().value;
    print('_testReadPro $value');
  }

  @override
  Widget build(BuildContext context) {
    print('当前 界面  执行了build方法。。。。。。。。。。 ');
    mContext = context;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // .. ${context.watch<CounterModel>().value} 当前界面使用它，会导致所用界面都builder
              'You have pushed the button this many times: ',
            ),
            InkWell(onTap: _testReadPro,
            child: CustomTestWidget(),),
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                print('当前 界面  Consumer 执行了。。。。。。。。。。 ');

                return Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.display1,
                );
              } ,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                Provider.of<CounterModel>(context, listen: false).increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: () =>
                Provider.of<CounterModel>(context, listen: false).decrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
