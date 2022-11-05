import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

class ContactListTile extends StatelessWidget {
  late final String _name;
  late final String _phone;
  late final String _email;

  ContactListTile(Contact contact, {super.key}) {
    _name = contact.displayName.trim();
    _phone = contact.phones.isNotEmpty ? contact.phones.first : '';
    _email = contact.emails.isNotEmpty ? contact.emails.first : '';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_phone),
          Text(_email),
        ],
      ),
    );
  }
}
