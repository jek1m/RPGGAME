import 'dart:io';

class Game {
  int killmonsters = 0; // 물리친 몬스터 개수 : 몬스터 리스트의 개수보다 클 수 없다.
  List<Monster> monsterList = [];
  List<Character> characterList = [];

  void addCharacter(Character character) {
    characterList.add(character);
    print("캐릭터가 추가되었습니다: ${character.name}");
  }

  // void startGame() {

  // }

  // void battle() {

  // }
}

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
  String? name;
  int? health;
  int? attack;
  int? defense;
  
  //Character(name, health, attack, defense); //Character에 4가지 변수를받겠다선언 34번 name과다름

  // Character(newname,health,attack,defense){ //생성자함수시작
  //   this.name = newname; //34번 name에 40(받은)name을 넣겠다
  // }

  Character({ //^간소화버전
    this.name, this.health, this.attack, this.defense
  });
}

Character loadCharacterStats() {
  try {
    final file = File('assets/characters.txt');
    final contents = file.readAsStringSync();
    final stats = contents.split(',');
    if (stats.length != 3) throw FormatException('Invalid character data');
      
    int health = int.parse(stats[0]);
    int attack = int.parse(stats[1]);
    int defense = int.parse(stats[2]);
      
    String name = getCharacterName();
    Character character = Character(name : name, health : health, attack : attack, defense : defense); //45번 {}일때 named파라미터 넣기
    print(character);

    return character;
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
  Game go1 = Game();
  Character character1 = loadCharacterStats();
  go1.addCharacter(character1);
}
