import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'contact_book_item.dart';

class PhoneBookView extends StatefulWidget {
  const PhoneBookView({Key? key}) : super(key: key);

  @override
  State<PhoneBookView> createState() => _PhoneBookViewState();
}

class _PhoneBookViewState extends State<PhoneBookView> {
  final List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _getContacts().then((contacts) {
      setState(() {
        _contacts.addAll(contacts);
        _filteredContacts.addAll(contacts);
      });
    });
  }

  Future<List<Contact>> _getContacts() async {
    await Permission.contacts.request();
    return await FastContacts.allContacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: _searchContacts,
            decoration: const InputDecoration(
              labelText: 'Поиск',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredContacts.length,
              itemBuilder: (_, index) {
                final contact = _filteredContacts[index];
                return ContactListTile(contact);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _searchContacts(String query) {
    final lowerCaseQuery = query.trim().toLowerCase();
    if (lowerCaseQuery.isNotEmpty) {
      final suggestions = _filteredContacts.where((contact) {
        return contact.displayName.toLowerCase().contains(lowerCaseQuery);
      });

      _replaceFilteredContacts(suggestions);
    } else {
      _replaceFilteredContacts(_contacts);
    }
  }

  void _replaceFilteredContacts(Iterable<Contact> contacts) {
    setState(() {
      _filteredContacts = contacts.toList(growable: false);
    });
  }
}
