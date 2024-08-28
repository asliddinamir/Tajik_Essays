import 'package:flutter/material.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E88E5), // Blue background color
        centerTitle: true,
        title: const Text(
          'Донатсия',
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
              'Мурочиат:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            // Donation Instructions
            Text(
              'Агар шумо хоҳед, ки кӯмак расонед ё хайроти молиявӣ кунед, '
              'лутфан рақами корти зеринро истифода баред.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            // Card Number
            Row(
              children: [
                Icon(Icons.credit_card, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Рақами корт: 4444 8888 1050 9624',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold, // Bold card number
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Bank Information
            Row(
              children: [
                Icon(Icons.account_balance, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Банк: Alif Bank',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold, // Bold bank name
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Thank You Message
            Text(
              'Ташаккур барои кӯмаки Шумо!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
