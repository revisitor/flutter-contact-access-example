import 'package:flutter/material.dart';

import 'contact_book_view.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhoneBookView(),
    );
  }
}
