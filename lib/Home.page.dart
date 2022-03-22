import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gasolina_alcool/widgets/input.widget.dart';
import 'package:gasolina_alcool/widgets/loading-button.widget.dart';
import 'package:gasolina_alcool/widgets/logo.widget.dart';
import 'package:gasolina_alcool/widgets/success.widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var _gasCtrl = MoneyMaskedTextController();
  var _alcCtrl = MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          const Logo(),
          Success(
            reset: () {},
            result: "Compensa X",
          ),
          Input(
            label: "Gasolina",
            ctrl: _gasCtrl,
          ),
          Input(
            label: "Álcool",
            ctrl: _alcCtrl,
          ),
          LoadingButton(
            busy: false,
            func: () {},
            invert: false,
            text: "Calcular",
          ),
        ],
      ),
    );
  }
}
