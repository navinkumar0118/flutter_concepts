import 'package:flutter/material.dart';

class TempWidget extends StatefulWidget {
  final String imageUrl;
  const TempWidget(this.imageUrl, {super.key});

  @override
  State<TempWidget> createState() => _TempWidgetState();
}

class _TempWidgetState extends State<TempWidget> {
  @override
  Widget build(BuildContext context) {
    return Image(image: NetworkImage(widget.imageUrl));
  }
}
