library free_poll.customer;

class Customer {
  int number;
  String name;
  String surname;
  String gender;
  String address;

  Customer(this.number, this.name, this.surname, this.gender, [this.address]);

  String toString() => '$number: $name $surname ($gender). Address: $address';
}