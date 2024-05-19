import 'package:flutter/material.dart';

class HelpItem extends StatefulWidget {
  final String text;
  final Function onTap;
  const HelpItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<HelpItem> createState() => _HelpItemState();
}

class _HelpItemState extends State<HelpItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.text, style: Theme.of(context).textTheme.subtitle1,),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      )
    );
  }
}
