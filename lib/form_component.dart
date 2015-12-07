library free_poll.form_component;

import 'package:angular2/angular2.dart';
import 'package:free_poll/customer.dart';

const List<String> _genders = const ['Male', 'Female'];

@Component(
    selector: 'my-form',
    templateUrl: 'form_component.html',
    directives: const [CORE_DIRECTIVES, FORM_DIRECTIVES]
)
class FormComponent {
  List<String> get genders => _genders;
  bool submitted = false;
  Customer customer = new Customer(1, 'Burak', 'ince', _genders[0], 'Adres detayi');
  String get diagnostic => 'DIAGNOSTIC: $customer';

  onSubmit() {
    submitted = true;
  }
}