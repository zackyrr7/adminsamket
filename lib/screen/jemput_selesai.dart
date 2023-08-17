import 'package:flutter/material.dart';

class JemputSelesai extends StatefulWidget {
  const JemputSelesai({super.key});

  @override
  State<JemputSelesai> createState() => _JemputSelesaiState();
}

class _JemputSelesaiState extends State<JemputSelesai>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}