import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneAlert extends StatelessWidget {
  late final String _phone;
  late final Uri _phoneCallUri = Uri.parse('tel:$_phone');
  late final Uri _phoneSearchUri = Uri.parse('https://yandex.ru/search/?text=$_phone');

  PhoneAlert({required String phone, Key? key}) : super(key: key) {
    _phone = phone;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Выберите действие'),
      content: Text(_phone),
      actions: [
        ElevatedButton(
          onPressed: _call,
          child: const Text('Позвонить'),
        ),
        ElevatedButton(
          onPressed: _search,
          child: const Text('Кто это?'),
        ),
      ],
    );
  }

  Future<void> _call() async => await launchUrl(_phoneCallUri);

  Future<void> _search() async => await launchUrl(_phoneSearchUri);
}
