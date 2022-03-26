import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gasolina_alcool/widgets/input.widget.dart';
import 'package:gasolina_alcool/widgets/loading-button.widget.dart';
import 'package:gasolina_alcool/widgets/logo.widget.dart';
import 'package:gasolina_alcool/widgets/submit-form.dart';
import 'package:gasolina_alcool/widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _complete = false;
  var _resultText = "";
  var gasCtrl = MoneyMaskedTextController();
  var alcCtrl = MoneyMaskedTextController();
  var _busy = false;

  Function()? submitFunc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          const Logo(),
          _complete
              ? Success(
                  result: _resultText,
                  reset: reset,
                )
              : SubmitForm(
                  gasCtrl: gasCtrl,
                  alcCtrl: alcCtrl,
                  busy: _busy,
                  submitFunc: calculate,
                )
        ],
      ),
    );
  }

  Future calculate() async {
    double alc =
        double.parse(alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      _complete = false;
      _busy = true;
    });

    return Future.delayed(
      const Duration(seconds: 1),
      () => {
        setState(() {
          if (res >= 0.7) {
            _resultText = "Compensa Gasolina";
          } else {
            _resultText = "Compensa utilizar Álcool";
          }
          _busy = true;
          _complete = true;
        })
      },
    );
  }

  reset() {
    setState(() {
      alcCtrl = new MoneyMaskedTextController();
      gasCtrl = new MoneyMaskedTextController();
      _complete = false;
      _busy = false;
    });
  }
}
