import 'package:flutter/material.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'donation_page.dart';

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
            height: 220, // Responsive height
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
                const Spacer(),
                // App Logo and Name
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      // Column for logo and title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/logo.png', // Path to your logo image
                              width: 48.0, // Adjust width as needed
                              height: 48.0, // Adjust height as needed
                              fit: BoxFit
                                  .cover, // Ensure the image covers the area
                            ),
                          ),
                          const SizedBox(
                              height: 8), // Space between logo and title
                          const Text(
                            'Эссе ва Иншоҳо ба тоҷикӣ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DonationPage(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
