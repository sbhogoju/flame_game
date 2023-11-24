import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FullScreenSheet extends StatelessWidget {
  const FullScreenSheet({super.key, required this.game});
  final FlameGame game;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                game.overlays.remove('menu2');
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
          title: const Text(
            'Shop',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Card(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            title: Text(
                              'Header',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              'Subhead',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            leading: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              child: Text('A',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)),
                            ),
                            trailing: const Icon(Icons.more_vert),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          Image.asset(
                            'assets/images/media.png',
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('Title'),
                                const Text('Subhead'),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                const Text(
                                    'Lorem ipsum dolor sit emit, connector applesauce elite, sed do europe'),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    OutlinedButton(
                                        onPressed: () {},
                                        child: const Text('Disabled')),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            maximumSize:
                                                const Size.fromHeight(50)),
                                        onPressed: () {},
                                        child: Text('Enabled',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary))),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ListTile(
                          dense: true,
                          title: Text(
                            'Header',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            'Subhead',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          leading: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            child: Text('A',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                          ),
                          contentPadding: const EdgeInsets.only(left: 8),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              ),
                              child: Image.asset(
                                'assets/images/media.png',
                                height: 80,
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
