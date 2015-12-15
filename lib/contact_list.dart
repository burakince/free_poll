library free_poll.contact_list;

import 'package:angular2/angular2.dart';

@Component(selector: 'contact-list')
@View(
    template: '''
    <div class="addContactControls">
      <input #name placeholder="name">
      <input #phone placeholder="phone">
      <button (click)="addContact(name.value, phone.value)">Add Contact</button>
    </div>
    <table *ng-if="contacts.length > 0">
      <thead>
        <tr>
          <td>Name and phone number</td>
        </tr>
      </thead>
      <tbody>
        <tr *ng-for="#contact of contacts">
          <td>{{contact.descr}}</td>
          <td><button (click)="removeContact(contact)">Delete</button></td>
        </tr>
      </tbody>
    </table>
    ''',
    styles: const [
      'table {margin-top: 20px}',
      'thead {font-weight: bold}'
    ],
    directives: const [CORE_DIRECTIVES])
class ContactList {
  List<Contact> contacts = [];

  addContact(String name, String phone) =>
      contacts.add(new Contact(name, phone));

  removeContact(contact) => contacts.remove(contact);
}

class Contact {
  String name, phone;

  String get descr => name + ' ' + phone;

  Contact(this.name, this.phone);
}