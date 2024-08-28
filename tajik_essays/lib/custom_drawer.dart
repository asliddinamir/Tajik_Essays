import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          Container(
            color: const Color(0xFF1E88E5), // Blue background color
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                // Close button at the top right
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the drawer
                    },
                  ),
                ),
                // App Icon and Name
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.insert_drive_file, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Эссе ва Иншоҳо ба тоҷикӣ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Menu Items
          ListTile(
            leading: const Icon(Icons.info, color: Color(0xFF1E88E5)),
            title: const Text('Оиди Барнома'),
            onTap: () {
              // Handle navigation to About page
              Navigator.of(context).pushNamed('/about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail, color: Color(0xFF1E88E5)),
            title: const Text('Тамос'),
            onTap: () {
              // Handle navigation to Contact page
              Navigator.of(context).pushNamed('/contact');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Color(0xFF1E88E5)),
            title: const Text('Донатсия'),
            onTap: () {
              // Handle navigation to Donation page
              Navigator.of(context).pushNamed('/donation');
            },
          ),
        ],
      ),
    );
  }
}
