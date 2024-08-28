import 'package:flutter/material.dart';
import 'about_page.dart';
import 'contact_page.dart';
// import 'donation_page.dart';

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
            height: 220.0, // Adjusted height for header
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space between children
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
                // Spacer to push the title to the bottom
                Spacer(),
                // App Icon and Name
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the content
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
          SizedBox(height: 46),
          ListTile(
            leading: const Icon(Icons.info, color: Color(0xFF1E88E5)),
            title: const Text(
              'Оиди Барнома',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AboutPage(),
              ));
            },
          ),
          SizedBox(height: 26),
          ListTile(
            leading: const Icon(Icons.contact_mail, color: Color(0xFF1E88E5)),
            title: const Text(
              'Тамос',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ContactPage(),
              ));
            },
          ),
          const SizedBox(height: 26),
          ListTile(
            leading: const Icon(Icons.favorite, color: Color(0xFF1E88E5)),
            title: const Text(
              'Донатсия',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const DonationPage(),
              // ));
            },
          ),
        ],
      ),
    );
  }
}
