import 'package:flutter/material.dart';
import 'package:re_spira_app_flutter/landscape_locker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    landscapeModeOnly();

    return MaterialApp(
      title: 're_spira',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  Widget _buildTopRow() =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDanteTextButton(),
          _buildBreathIcon(),
          _buildPostcardTextButton(),
        ],
      );

  static const double bottomRowSpace = 40;

  Widget _buildBottomRow() =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStopIcon(),
          const SizedBox(width: bottomRowSpace),
          _buildDrawIcon(),
          const SizedBox(width: bottomRowSpace),
          _buildResetIcon(),
        ],
      );

  Widget _buildColumn() =>
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTopRow(),
          const Text("Ciao ciao"),
          _buildBottomRow(),
        ],
      );

  Widget _buildDanteTextButton() =>
      _buildTextButton(AppLocalizations.of(context)!.danteButton);


  Widget _buildPostcardTextButton() =>
      _buildTextButton(AppLocalizations.of(context)!.postcardsButton);

  Widget _buildTextButton(String text) =>
      TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 15),
        ),
        onPressed: () {},
        child: Text(text),
      );

  Widget _buildBreathIcon()  =>
      IconButton(
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
          ),
          onPressed: () {
          });

  Widget _buildStopIcon()  =>
      IconButton(
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
          ),
          onPressed: () {
          });


  Widget _buildDrawIcon() =>
      IconButton(
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
          ),
          onPressed: () {
          });


  Widget _buildResetIcon() =>
      IconButton(
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
          ),
          onPressed: () {
          });

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _buildColumn(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
