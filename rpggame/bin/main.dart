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

class Monster {
  String? monsterName;
  int? monsterHealth;
  int? attackMax;
  int defensePower = 0;

  Monster(monsterName, monsterHealth, attackMax, defensePower);
}

void loadMonsterStats(n) {
  try {
    final file = File('assets/monsters.txt');
    final lines = file.readAsLinesSync();
    final stats = lines[n].split(',');
    String monsterName = stats[0];
    int monsterHealth = int.parse(stats[1]);
    int attackMax = int.parse(stats[2]);
    Monster monster = Monster(monsterName, monsterHealth, attackMax, 0);
    print(attackMax);
  } catch (e) {
    print('캐릭터 데이터를 불러오는 데 실패했습니다: $e');
    exit(1);
  }
}



void main() {
  loadCharacterStats();
  loadMonsterStats(1);
}
