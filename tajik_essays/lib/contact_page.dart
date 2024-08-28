import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For using FontAwesome icons

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E88E5), // Blue background color
        title: Text('Тамос'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            const Text(
              'Барои маълумоти бештар ё пешниҳодҳо:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Агар шумо саволҳо ё пешниҳодҳо дошта бошед, лутфан бо мо дар тамос шавед:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            // Email Contact
            const Row(
              children: [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Почтаи электронӣ: asliddinamir3@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // WhatsApp Contact
            Row(
              children: [
                Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                const SizedBox(width: 8),
                const Text(
                  'WhatsApp: +60189808402',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Instagram Contact
            Row(
              children: [
                Icon(FontAwesomeIcons.instagram, color: Colors.purple),
                const SizedBox(width: 8),
                const Text(
                  'Instagram: @itsasliddinamir',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Telegram Contact
            Row(
              children: [
                Icon(FontAwesomeIcons.telegram, color: Colors.blue),
                const SizedBox(width: 8),
                const Text(
                  'Telegram: @alijanets2024',
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
