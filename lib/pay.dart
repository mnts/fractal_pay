import 'package:currency_fractal/fractals/transaction.dart';
import 'package:flutter/material.dart';
import 'package:fractal_flutter/index.dart';
import 'package:fractal_layout/index.dart';
import 'package:fractal_layout/views/thing.dart';

import './widgets/index.dart';
import 'widgets/card.dart';

class FractalPay {
  static void initiate() {
    FractalThing.areas.add(
      Builder(
        builder: (ctx) => FPayButton(),
      ),
    );

    final uif = UIF<TransactionFractal>('transaction');
    uif.builders[''] = (f) => FTransaction(f);
  }
}
