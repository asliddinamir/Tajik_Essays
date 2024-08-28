import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme.dart';
import 'custom_drawer.dart'; // Import the custom drawer file
import 'essays_data.dart'; // Import the essays data file

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 39, 117, 181),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Essays in Tajik',
      theme: appTheme,
      home: const EssaysListScreen(),
    );
  }
}

class EssaysListScreen extends StatefulWidget {
  const EssaysListScreen({super.key});

  @override
  _EssaysListScreenState createState() => _EssaysListScreenState();
}

class _EssaysListScreenState extends State<EssaysListScreen> {
  String searchQuery = '';
  final ScrollController _scrollController = ScrollController();

  late List<Map<String, String>> _filteredEssays;

  @override
  void initState() {
    super.initState();
    _filteredEssays = essayData;
  }

  void _filterEssays(String query) {
    setState(() {
      searchQuery = query;
      if (searchQuery.isEmpty) {
        _filteredEssays = essayData;
      } else {
        _filteredEssays = essayData
            .where((essay) => essay['title']!
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        title: const Text(
          'Эссе ва Иншоҳо ба тоҷикӣ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0, // Slightly smaller font size for the title
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ҷустуҷӯи иншоҳо...',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0, // Smaller font size for hint text
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: _filterEssays,
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              itemCount: _filteredEssays.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 145, 145, 145)
                            .withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(6.0),
                    leading: Container(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: const Icon(
                        Icons.article,
                        color: Colors.blue,
                        size: 24.0,
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${index + 1}. ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: const Color.fromARGB(255, 47, 46, 46),
                                  fontSize: 16.0,
                                ),
                          ),
                          TextSpan(
                            text: _filteredEssays[index]['title']!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: const Color.fromARGB(255, 47, 46, 46),
                                  fontSize: 16.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(_createPageTransition(
                        EssayDetailScreen(
                          title: _filteredEssays[index]['title']!,
                          content: _filteredEssays[index]['full_content']!,
                        ),
                      ));
                    },
                  ),
                );
              },
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                backgroundColor: Colors.blue,
                tooltip: 'To the Top',
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageRouteBuilder _createPageTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}

class EssayDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const EssayDetailScreen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 17.0,
                ),
          ),
        ),
      ),
    );
  }
}
