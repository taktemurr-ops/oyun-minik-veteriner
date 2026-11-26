import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_minik_veteriner/oyun_minik_veteriner.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(minikVeterinerConfig.title.length, 33);
    expect(minikVeterinerConfig.tagline.length, 33);
    for (final s in minikVeterinerConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(minikVeterinerConfig.gameId, minikVeterinerId);
    expect(minikVeterinerRules.gameId, minikVeterinerId);
    expect(minikVeterinerConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(minikVeterinerRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: minikVeterinerId, optionalMechanics: minikVeterinerRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(minikVeterinerRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
