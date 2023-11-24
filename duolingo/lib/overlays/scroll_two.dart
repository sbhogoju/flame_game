import 'package:flutter/material.dart';

class ScrollWidget2 extends StatelessWidget {
  const ScrollWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 130, 16, 100),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 30,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: const Color.fromARGB(255, 68, 255, 109),
            child: Text("Element $index"),
          );
        },
      ),
    );
  }
}
