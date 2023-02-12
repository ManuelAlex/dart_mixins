import 'dart:mirrors';

void main(List<String> args) {
  final person = Person(age: 25, name: 'John');
  print(person);
  final house = House(address: "No 10 address", rooms: 10);
  print(house);
}

mixin HasDescription {
  @override
  String toString() {
    final reflection = reflect(this);
    final thisType = MirrorSystem.getName(reflection.type.simpleName);
    final availVariable =
        reflection.type.declarations.values.whereType<VariableMirror>();
    final properties = <String, dynamic>{
      for (final field in availVariable)
        field.askKey: reflection.getField(field.simpleName).reflectee
    }.toString();
    return '$thisType = $properties';
  }
}

extension Askkey on VariableMirror {
  String get askKey {
    final fieldName = MirrorSystem.getName(simpleName);
    final fieldType = MirrorSystem.getName(simpleName);
    return '$fieldName ($fieldType)';
  }
}

class Person with HasDescription {
  final String name;
  final int age;
  const Person({required this.age, required this.name});
}

class House with HasDescription {
  final String address;
  final int rooms;
  const House({required this.address, required this.rooms});
}
