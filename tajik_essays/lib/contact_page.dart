import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For using FontAwesome icons

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E88E5), // Blue background color
        centerTitle: true,
        title: const Text(
          'Тамос',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Text(
              'Барои маълумоти бештар ё пешниҳодҳо:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Агар шумо саволҳо ё пешниҳодҳо дошта бошед, лутфан бо мо дар тамос шавед:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            SizedBox(height: 46),
            // Email Contact
            Row(
              children: [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Почтаи электронӣ: \nasliddinamir3@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 46),
            // WhatsApp Contact
            Row(
              children: [
                Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'WhatsApp: +60189808402',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 46),
            // Instagram Contact
            Row(
              children: [
                Icon(FontAwesomeIcons.instagram, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  'Instagram: @itsasliddinamir',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 46),
            // Telegram Contact
            Row(
              children: [
                Icon(FontAwesomeIcons.telegram, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Telegram: @asliddinamir',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
