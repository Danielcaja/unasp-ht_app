import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).secondaryHeaderColor),
      );
}
