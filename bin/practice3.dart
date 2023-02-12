void main(List<String> args) {
  final whiskers = Cat(age: 2);
  print(whiskers.age);
  whiskers.increamentAge();
  print(whiskers.age);
  whiskers.increamentAge();
  print(whiskers.age);
}

mixin HasAge {
  abstract int age;
  void increamentAge() => age++;
}

class Cat with HasAge {
  @override
  int age;
  Cat({required this.age});
}
