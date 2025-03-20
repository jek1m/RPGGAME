import 'dart:io';


String getCharacterName() {
  RegExp regex = RegExp(r'^[a-zA-Z가-힣]+$');
  String? inputName;
  while (true) {
    print("캐릭터의 이름을 입력하세요: ");
    inputName = stdin.readLineSync();
    if (inputName != null && regex.hasMatch(inputName)) {
      break;
    } else {
      print("잘못된 입력입니다. 특수문자나 숫자는 입력하실 수 없습니다.");
    }
  }
  return inputName;
}

class Character {
  String? userName;
  int? userHealth;
  int? attackPower;
  int? defensePower;

  Character(userName, userHealth, attackPower, defensePower);
}

void loadCharacterStats() {


  try {
    final file = File('assets/characters.txt');
    final contents = file.readAsStringSync();
    final stats = contents.split(',');
    if (stats.length != 3) throw FormatException('Invalid character data');
      
    int health = int.parse(stats[0]);
    int attack = int.parse(stats[1]);
    int defense = int.parse(stats[2]);
      
    String name = getCharacterName();
    Character character = Character(name, health, attack, defense);
    print(name);
    print(defense);
  } catch (e) {
    print('캐릭터 데이터를 불러오는 데 실패했습니다: $e');
    exit(1);
  }
}


void main() {
  //String name = getCharacterName();
  //print(name);
  //var file1 = File('characters.txt');
  // var file1 = File('C:/Users/jieun/rpggame/RPGGAME/rpggame/assets/characters.txt');
  // final contents = file1.readAsStringSync();
  // final stats = contents.split(',');
  // int health = int.parse(stats[0]);
  // print(health);
  loadCharacterStats();


}

// class Character {
//   String? name;
//   int? health;
//   int? attackPower;
//   int? defensePower;

//   Character(this.name, this.health, this.attackPower, this.defensePower);
// }

// void loadCharacterStats() {
//   try {
//     final file = File('characters.txt');
//     final contents = file.readAsStringSync();
//     final stats = contents.split(',');
//     if (stats.length != 3) throw FormatException('Invalid character data');
      
//     int health = int.parse(stats[0]);
//     int attack = int.parse(stats[1]);
//     int defense = int.parse(stats[2]);
      
//     String name = getCharacterName();
//     // character = Character(name, health, attack, defense);
//   } catch (e) {
//     print('캐릭터 데이터를 불러오는 데 실패했습니다: $e');
//     exit(1);
//   }
// }
