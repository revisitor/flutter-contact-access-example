import 'package:flutter/material.dart';

import 'contact.dart';
import 'phone_alert.dart';

class ContactListTile extends StatelessWidget {
  final ContactModel contact;

  const ContactListTile(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: ListTile(
        title: Text(contact.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.phone),
            Text(contact.email),
          ],
        ),
      ),
    );
  }
  
  void _onTap(BuildContext context) {
    if (contact.phone.isNotEmpty) {
      _phoneDialogBuilder(context);
    }
  }
  
  Future<void> _phoneDialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return PhoneAlert(
          phone: contact.phone,
        );
      },
    );
  }
}
