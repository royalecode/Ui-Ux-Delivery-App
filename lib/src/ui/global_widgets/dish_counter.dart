import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/utils/font_styles.dart';


enum DishCounterSize { normal, mini }


class DishCounter extends StatefulWidget {
  final void Function(int) onChanged;
  final DishCounterSize size;
  final int initialValue;
  const DishCounter({
    Key key,
    @required this.onChanged,
    this.size = DishCounterSize.normal,
    this.initialValue = 0,
  }) : super(key: key);

  @override
  State<DishCounter> createState() => _DishCounterState();
}

class _DishCounterState extends State<DishCounter> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  void _updateCounter(int counter) {
    if (counter >= 0) {
      _counter = counter;
      setState(() {});
      widget.onChanged(_counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool mini = widget.size == DishCounterSize.mini;
    final double padding = mini ? 5 : 10;
    final double fontSize = mini ? 25 : 30;

    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            minSize: 20,
            onPressed: () => _updateCounter(_counter - 1),
            color: Colors.grey,
            padding: EdgeInsets.all(padding),
            borderRadius: BorderRadius.circular(30),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "$_counter",
            style: FontStyles.regular.copyWith(
              fontSize: fontSize,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CupertinoButton(
            minSize: 20,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(30),
            padding: EdgeInsets.all(padding),
            onPressed: () => _updateCounter(_counter + 1),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
