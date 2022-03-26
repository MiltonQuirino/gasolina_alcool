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
  var _gasCtrl = MoneyMaskedTextController();
  var _alcCtrl = MoneyMaskedTextController();
  var _busy = false;
  Color _color = Colors.deepOrange;

  Function()? submitFunc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          child: ListView(
            children: <Widget>[
              const Logo(),
              _complete
                  ? Success(
                      result: _resultText,
                      reset: reset,
                    )
                  : SubmitForm(
                      gasCtrl: _gasCtrl,
                      alcCtrl: _alcCtrl,
                      busy: _busy,
                      submitFunc: calculate,
                    )
            ],
          ),
          duration: Duration(microseconds: 1200),
          color: _color,
        ));
  }

  Future calculate() async {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      _color = Colors.deepOrangeAccent;
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
      _alcCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _complete = false;
      _busy = false;
      _color = Colors.deepOrange;
    });
  }
}
