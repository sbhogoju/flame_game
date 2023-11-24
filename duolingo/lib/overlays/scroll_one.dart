import 'package:flutter/material.dart';

class ScrollWidget extends StatelessWidget {
  const ScrollWidget({super.key});

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
            color: Colors.blueAccent,
            child: Text("Element $index"),
          );
        },
      ),
    );
  }
}
