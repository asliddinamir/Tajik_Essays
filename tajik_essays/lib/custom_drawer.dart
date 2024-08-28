import 'package:flutter/material.dart';
import 'about_page.dart';
import 'contact_page.dart';
// import 'donation_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.25; // 25% of the screen height

    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          Container(
            color: const Color(0xFF1E88E5), // Blue background color
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: headerHeight, // Responsive height
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
                // Spacer to push the content to the bottom
                Spacer(),
                // App Icon and Name
                const Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      // Column for icon and title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align column to the start
                        children: [
                          Icon(Icons.insert_drive_file,
                              color: Colors.white,
                              size: 48.0), // Adjust size as needed
                          SizedBox(height: 8), // Space between icon and title
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Body with white background
          Expanded(
            child: Container(
              color: Colors.white, // White background color for the body
              child: Column(
                children: [
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
                    leading: const Icon(Icons.contact_mail,
                        color: Color(0xFF1E88E5)),
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
                    leading:
                        const Icon(Icons.favorite, color: Color(0xFF1E88E5)),
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
            ),
          ),
        ],
      ),
    );
  }
}
