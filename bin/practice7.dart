//mixin equality
import 'package:uuid/uuid.dart';

void main(List<String> args) {
  final uuid1 = Uuid().v4();
  final uuid2 = Uuid().v4();
  final person1 = Person(name: 'John', age: 12, id: uuid1);
  final person2 = Person(name: 'John', age: 12, id: uuid2);
  final person1Again = Person(name: 'john', age: 12, id: uuid1);
  if (person1 == person2) {
    print("person 1 person 2 are equal");
  } else {
    print("person 1 person 2 are Not equal");
  }

  if (person1 == person1Again) {
    print("person 1 person 2 are equal");
  } else {
    print("person 1 Again person 2 are Not equal");
  }
  if (person1Again == person2) {
    print("person 1 person 2 are equal");
  } else {
    print("person 1 Again person 2 are Not equal");
  }
}

mixin HasIndentifier {
  String get id;
  @override
  bool operator ==(Object others) =>
      identical(this, others) ||
      others is HasIndentifier &&
          runtimeType == others.runtimeType &&
          id == others.id;
}

class Person with HasIndentifier {
  @override
  final String id;
  final String name;
  final int age;
  Person({required this.name, required this.age, required this.id});
}
