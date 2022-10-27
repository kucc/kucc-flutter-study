import 'package:contacts_service/contacts_service.dart';
import 'package:kucc_flutter/services/permission_service.dart';

import '../model/local_contact.dart';

class LocalContactsService {
  static Future<List<LocalContact>?> getLocalContacts() async {
    var isGranted = await PermissionService.getPermission();

    if (isGranted) {
      var fetchedContacts = await ContactsService.getContacts();
      var localContacts = fetchedContacts.map<LocalContact>((contact) =>
        LocalContact(
          name: contact.displayName ?? 'Unknown',
          givenName: contact.givenName,
          familyName: contact.familyName
        )
      );

      return localContacts.toList();
    } else {
      return null;
    }
  }

  static Future<dynamic> addContact(LocalContact newContact) async {
    Contact newActualContact = Contact();
    newActualContact.displayName = newContact.name;
    newActualContact.familyName = newContact.familyName;
    newActualContact.givenName = newContact.givenName;

    return ContactsService.addContact(newActualContact);
  }
}