import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';

class TimePicker extends StatefulWidget {
  final BehaviorSubject<DateTime> dateController;
  final TextEditingController textController;
  final IconData icon;
  final String hintText;
  final Function onTap;

  const TimePicker({
    Key key,
    @required this.dateController,
    @required this.textController,
    @required this.icon,
    @required this.hintText,
    @required this.onTap,
  }) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => widget.onTap(),
        child: CustomTextField(
          enabled: false,
          controller: widget.textController,
          hintText: widget.hintText,
          icon: widget.icon,
          inputType: TextInputType.datetime,
        ),
      );
}
