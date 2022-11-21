class ContactModel {
  late final String name;
  late final String phone;
  late final String email;
  
  ContactModel({String? name, String? phone, String? email}) {
    this.name = name?.trim() ?? '';
    this.phone = phone?.trim() ?? '';
    this.email = email?.trim() ?? '';
  }
}