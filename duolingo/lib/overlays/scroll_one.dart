import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

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
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              // showPopover(
              //   context: context,
              //   bodyBuilder: (context) => const Text('Im inside popover'),
              //   onPop: () => print('Popover was popped!'),
              //   direction: PopoverDirection.top,
              //   width: 200,
              //   height: 400,
              //   arrowHeight: 15,
              //   arrowWidth: 30,
              // );
            },
            child: Container(
              height: 50,
              color: Colors.blueAccent,
              child: Text("Element $index"),
            ),
          );
        },
      ),
    );
  }
}
