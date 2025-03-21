// 작성자 : 플러터 6기 개발 김지은
// 작성일 : 2025.03.14
// [Dart 기초] 개인 과제 - 전투 RPG 게임
// 필수 정의 구현

// import 'dart:ffi';
import 'dart:io';
import 'dart:math';

// Game 클래스
class Game {
  int killmonsters = 0; // 물리친 몬스터 개수 : 몬스터 리스트의 개수보다 클 수 없다.
  List<Monster> monsterList = [];
  List<Character> characterList = [];
  String name1 = '';

  // characterList에 읽어온 character를 추가하는 기능
  String addCharacter(Character character) {
    characterList.add(character);
    String name1 = character.name.toString();
    return name1;
  }

  // monsterList에 읽어온 moster를 추가하는 기능
  void addMonster(Monster monster) {
    monsterList.add(monster);
  }

  // 게임 시작할 때 처음 캐릭터의 스탯을 보여주는 기능
  void firstTurn(Character character) {
    print('게임을 시작합니다!');
    print('${character.name} - 체력: ${character.health}, 공격력: ${character.attack}, 방어력: ${character.defense}');
    print('');
  }
  // 행동을 선택하는 기능
  void startGame() {
    print('행동을 선택하세요 (1: 공격, 2: 방어): ');
    String? input = stdin.readLineSync(); 
    int? inputnumber = int.tryParse(input ?? "");

    switch(inputnumber) {
      case 1:


      case 2:

      default:  

    }

  }

  void battle() {

  }

  // 랜덤으로 몬스터를 불러오는 기능
  void getRandomMonster() {
    var random = Random();
    int randomNumber = random.nextInt(monsterList.length);
    print('새로운 몬스터가 나타났습니다!');
    print('${monsterList[randomNumber].monsterName} - 체력: ${monsterList[randomNumber].monsterHealth}, 공격력: ${monsterList[randomNumber].attackMax}');

  }
}

// input으로 캐릭터 이름을 입력받는 기능
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

// Character 클래스
class Character {
  String? name;
  int? health;
  int? attack;
  int? defense;
  
  Character({ 
    this.name, this.health, this.attack, this.defense
  });
}

// chraacters.txt에서 불러오는 기능
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
    Character character = Character(name : name, health : health, attack : attack, defense : defense);
    return character;
  } catch (e) {
    print('캐릭터 데이터를 불러오는 데 실패했습니다: $e');
    exit(1);
  }
}

// Monster 클래스
class Monster {
  String? monsterName;
  int? monsterHealth;
  int? attackMax;
  int defensePower = 0;

  Monster({
    this.monsterName, this.monsterHealth, this.attackMax
  });

  @override
  String toString() {
    return '$monsterName $monsterHealth $attackMax $defensePower';
  }
}

// monsters.txt에서 불러오는 기능
Monster loadMonsterStats(n) {
  try {
    final file = File('assets/monsters.txt');
    final lines = file.readAsLinesSync();
    final stats = lines[n].split(',');
    String monsterName = stats[0];
    int monsterHealth = int.parse(stats[1]);
    int attackMax = int.parse(stats[2]);
    Monster monster = Monster(monsterName: monsterName, monsterHealth: monsterHealth, attackMax: attackMax);
    return monster;
  } catch (e) {
    print('캐릭터 데이터를 불러오는 데 실패했습니다: $e');
    exit(1);
  }
}

void main() {
  Character character1 = loadCharacterStats();
  Game go1 = Game();
  //String ex1 = go1.addCharacter(character1);
  go1.firstTurn(character1);
  Monster monster1 = loadMonsterStats(0);
  go1.addMonster(monster1);
  Monster monster2 = loadMonsterStats(1);
  go1.addMonster(monster2);
  Monster monster3 = loadMonsterStats(2);
  go1.addMonster(monster3);
  go1.getRandomMonster();

  
}
