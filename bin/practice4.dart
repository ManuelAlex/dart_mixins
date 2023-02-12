void main(List<String> args) {
  Human().run();
}

class HasTwoFeet {
  HasTwoFeet();
}

mixin CanRun on HasTwoFeet {
  void run() {
    print('$runtimeType is running');
  }
}

class Human extends HasTwoFeet with CanRun {}

class HasNoFeet {
  HasNoFeet();
}

class Fish extends HasNoFeet {
  Fish();
}
