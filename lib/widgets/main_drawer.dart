import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key, required this.onselectdraw});

  final void Function(String sal) onselectdraw;
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return SafeArea(
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.fastfood),
                  const Text("Ovqat Retsepti"),
                  IconButton(
                    icon: const Icon(Icons.exit_to_app, size: 42),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.restaurant,
                  size: 26,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                title: const Text('Ovqatlar'),
                // selected: _selectedIndex == 0,
                onTap: () {
                  widget.onselectdraw("ovqatlar");
                }),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 26,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              title: const Text('Filter '),
              selected: _selectedIndex == 0,
              onTap: () {
                widget.onselectdraw("filter");
              },
            ),
          ],
        ),
      ),
    );
  }
}
