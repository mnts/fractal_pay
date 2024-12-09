import 'package:currency_fractal/fractals/transaction.dart';
import 'package:fractal_layout/index.dart';
import 'package:fractal_layout/widget.dart';

class FTransaction extends FEventWidget {
  FTransaction(super.f, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(f.display),
        leading: f.ctrl.icon.widget,
      ),
    );
  }
}
