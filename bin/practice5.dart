void main(List<String> args) {
  final cat = <Cat>{
    Cat(age: 2, name: 'Kitty'),
    Cat(age: 3, name: 'meow'),
    Cat(age: 2, name: 'Kitty')
  };
  cat.forEach(print);
}

enum PetType { cat, dog }

mixin Pet {
  String get name;
  int get age;
  PetType get type;

  @override
  String toString() {
    return 'We re pet of type $runtimeType,name is $name and age is $age and type $type ';
  }

  @override
  int get hashCode => Object.hash(name, age, type);
  @override
  bool operator ==(Object other) => other.hashCode == hashCode;
}

class Cat with Pet {
  @override
  final int age;

  @override
  final String name;

  @override
  final PetType type;
  Cat({
    required this.age,
    required this.name,
  }) : type = PetType.cat;
}
