import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants.dart';
import '../source_type.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  //MARK: Pressed functions

  void _onDanteButtonPressed() {
    setState(() {
      _setDanteType();
    });
  }

  void _onPostcardButtonPressed() {
    setState(() {
      _setPostcardsType();
    });
  }

  void _onBreathButtonPressed() {
    setState(() {
      _recordingButtonState();
    });
  }

  void _onStopButtonPressed() {
    setState(() {
      _stopButtonState();
    });
  }

  void _onResetButtonPressed() {
    setState(() {
      _reset();
    });
  }

  void _onDrawButtonPressed() {
    setState(() {
      _drawingButtonState();
    });
  }

  void _setInitialButtonsState() {
    _isBreathButtonDisabled = false;
    _isStopButtonDisabled = true;
    _isDrawButtonDisabled = true;
    _isResetButtonDisabled = true;
    _setCurrentTypeButtonState();
  }

  void _setCurrentTypeButtonState() {
    switch(_sourceType) {
      case SourceType.postcards: {
        _setPostcardsButtonState();
      }
      break;

      case SourceType.dante: {
        _setDanteButtonState();
      }
      break;
    }
  }

  void _setDanteType() {
    _sourceType = SourceType.dante;
    _setDanteButtonState();
  }

  void _setDanteButtonState() {
    _isDanteButtonDisabled = true;
    _isPostcardsButtonDisabled = false;
  }

  void _setPostcardsType() {
    _sourceType = SourceType.postcards;
    _setPostcardsButtonState();
  }

  void _setPostcardsButtonState() {
    _isDanteButtonDisabled = false;
    _isPostcardsButtonDisabled = true;
  }

  void _recordingButtonState() {
    _isBreathButtonDisabled = true;
    _isStopButtonDisabled = false;
    _isDrawButtonDisabled = true;
    _isResetButtonDisabled = true;
  }

  void _stopButtonState() {
    _isBreathButtonDisabled = true;
    _isStopButtonDisabled = true;
    _isDrawButtonDisabled = false;
    _isResetButtonDisabled = false;
  }

  void _drawingButtonState() {
    _isBreathButtonDisabled = true;
    _isStopButtonDisabled = true;
    _isDrawButtonDisabled = true;
    _isResetButtonDisabled = true;
    _disableAllTypeButtons();
  }

  void _disableAllTypeButtons() {
    _isDanteButtonDisabled = true;
    _isPostcardsButtonDisabled = true;
  }

  void _reset() {
    _setInitialButtonsState();
  }

  //UI Build methods

  Widget _buildTopRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _buildDanteTextButton(),
      _buildBreathIcon(),
      _buildPostcardTextButton(),
    ],
  );

  static const double bottomRowSpace = 50;

  Widget _buildBottomRow() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildStopIcon(),
      const SizedBox(width: bottomRowSpace),
      _buildDrawIcon(),
      const SizedBox(width: bottomRowSpace),
      _buildResetIcon(),
    ],
  );

  Widget _buildColumn() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _buildTopRow(),
      const Text("Ciao ciao"),
      _buildBottomRow(),
    ],
  );

  Widget _buildDanteTextButton() =>
      _buildTextButton(AppLocalizations.of(context)!.danteButton,
          _bind(_isDanteButtonDisabled, _onDanteButtonPressed));

  Widget _buildPostcardTextButton() =>
      _buildTextButton(AppLocalizations.of(context)!.postcardsButton,
          _bind(_isPostcardsButtonDisabled, _onPostcardButtonPressed));

  Widget _buildTextButton(String text, Function()? onPressed) => TextButton(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(fontSize: 15),
    ),
    onPressed: onPressed,
    child: Text(text),
  );

  Widget _buildBreathIcon() =>
      _buildIconButton(48,
          Icons.air,
          _bind(_isBreathButtonDisabled, _onBreathButtonPressed));

  static const double bottomIconSize = 30;

  Widget _buildStopIcon() =>
      _buildIconButton(bottomIconSize,
          Icons.stop_outlined,
          _bind(_isStopButtonDisabled, _onStopButtonPressed));

  Widget _buildDrawIcon() =>
      _buildIconButton(bottomIconSize,
          Icons.gesture,
          _bind(_isDrawButtonDisabled, _onDrawButtonPressed));

  Widget _buildResetIcon() =>
      _buildIconButton(bottomIconSize,
          Icons.cancel_outlined,
          _bind(_isResetButtonDisabled, _onResetButtonPressed));

  Function()? _bind(bool isDisable, Function() onPressed) =>
      isDisable ? null : onPressed;

  Widget _buildIconButton(double iconSize, IconData iconData, Function()? onPressed) => IconButton(
      iconSize: iconSize,
      icon: Icon(
        iconData,
        color: onPressed == null ? Theme.of(context).disabledColor : accentColor,
      ),
      onPressed: onPressed);

  late SourceType _sourceType;

  late bool _isDanteButtonDisabled;
  late bool _isBreathButtonDisabled;
  late bool _isPostcardsButtonDisabled;
  late bool _isStopButtonDisabled;
  late bool _isDrawButtonDisabled;
  late bool _isResetButtonDisabled;

  @override
  void initState() {
    super.initState();

    _sourceType = SourceType.postcards;

    _setInitialButtonsState();
  }

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
    );
  }
}
