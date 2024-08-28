import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E88E5), // Blue background color
        centerTitle: true,
        title: const Text(
          'Оиди Барнома',
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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section for App Title and Description
            Text(
              'Барнома: «Эссе ва Иншоҳо ба тоҷикӣ»',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '«Эссе ва Иншоҳо ба тоҷикӣ» - ин барномаи мобилӣ мебошад, ки барои кӯмак ва дастгирии хонандагон ва донишҷӯён бо осор ва эссеҳои гуногун ба забони тоҷикӣ пешбинӣ шудааст. Барнома маҷмӯи васеи эссеҳоро дар бар мегирад, ки ба хонандагон имконият медиҳад, то осон ва дар вақти зарурӣ ба маводҳои таълимӣ дастрасӣ пайдо кунанд.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            // Section for Creator Information
            Text(
              'Барномасоз:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Барномаро ман, Аслиддин Амиров, таҳия намудам. Ҳадафи ман, таъмин кардани маводҳои таълимӣ ва осорҳои кӯмакрасон барои омӯзгорон ва донишҷӯён мебошад. Агар шумо саволҳо ё пешниҳодҳо дошта бошед, лутфан бо ман тавассути почта ё дигар воситаҳо иртибот кунед.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            // Section for Contact Information
            Text(
              'Тамос:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Барои маълумоти бештар ё пешниҳодҳо, лутфан бо мо муроҷиат кунед:\n\nПочтаи электронӣ: asliddinamir3@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
