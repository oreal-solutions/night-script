// A simple program to demonstrate async await in nightScript
//
// The nightScript authors

struct Person {
  name: string;
  surname: string;
}

setter Person.nameSurname(value: string) {
  final units = value.split(" ");
  if(units.length > 2) {
    thow Error("Too many units in value");
  }

  this.name = units[0];
  this.surname = units[1];
}

getter Person.nameSurname => "${this.name} ${this.surname}";

function main() {
  final person = Person {
    name: "Hello",
    surname: "World",
  };

  // Hello World
  print(person.nameSurname);

  person.nameSurname = "Batandwa Mgutsi";
  
  // Batandwa
  print(person.name);

  // Mgutsi
  print(person.surname);
}