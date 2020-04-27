import 'package:flutter/widgets.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';

class DatePicker extends StatefulWidget {
  final Function onTap;
  final TextEditingController controller;
  final IconData icon;
  final String hintText;

  const DatePicker({
    Key key,
    @required this.onTap,
    @required this.controller,
    @required this.icon,
    @required this.hintText,
  }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => widget.onTap(),
        child: CustomTextField(
          enabled: false,
          controller: widget.controller,
          hintText: widget.hintText,
          icon: widget.icon,
          inputType: TextInputType.datetime,
        ),
      );
}
