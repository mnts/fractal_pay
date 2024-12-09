import 'package:currency_fractal/fractals/transaction.dart';
import 'package:flutter/material.dart';
import 'package:fractal_layout/index.dart';
import 'package:signed_fractal/signed_fractal.dart';
import 'package:fractal_flutter/fractal_flutter.dart';

class FPayButton extends StatefulWidget {
  const FPayButton({super.key});

  @override
  State<FPayButton> createState() => _FPayButtonState();
}

class _FPayButtonState extends State<FPayButton> {
  late final thing = context.read<Rewritable?>() as EventFractal;

  var payer = UserFractal.active.value;
  late var receiver = thing.owner?.value;
  late final price = thing['price'] as double?;
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return price is num
        ? FractalBlur(
            level: 0,
            child: SizedBox(
              height: 48,
              child: Row(
                //scrollDirection: Axis.horizontal,
                children: [
                  //if (thing.owner != null)
                  const Icon(Icons.price_change_rounded),
                  SizedBox(
                    width: 160,
                    child: FractalSelector(
                      preSelected: payer,
                      onSelected: (f) {
                        payer = f;
                      },
                      flow: UserFractal.flow,
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: () {
                      transfer();
                    },
                    icon: amount > 0
                        ? Text('$amount')
                        : const Icon(Icons.add_shopping_cart),
                    label: Text('${thing['price']}'),
                  ),
                  SizedBox(
                    width: 150,
                    child: FractalSelector(
                      preSelected: receiver,
                      onSelected: (f) {
                        receiver = f;
                      },
                      flow: UserFractal.flow,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

  transfer() {
    TransactionFractal(
      thing: thing,
      to: receiver!,
      from: payer!,
      amount: price!,
    ).synch();
    setState(() {
      amount++;
    });
  }
}
