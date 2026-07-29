import 'package:filhos_do_eden_personagem/app/model/character_type_definition.dart';
import 'package:filhos_do_eden_personagem/app/model/skill_bonus.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/character_type.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/power.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/skill.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';

abstract class CharacterTypeCatalog {
  static const Map<CharacterType, CharacterClassDefinition> classes = {
    CharacterType.querubim: CharacterClassDefinition(
      type: CharacterType.querubim,
      name: 'Querubim',
      description: 'Querubins são soldados celestes inclinados ao combate...',
      lightAndDarkness: LightAndDarkness.light,
      possibleStrains: [Strain.legionario, Strain.shedu, Strain.erelim],
      skillsBonus: [
        SkillBonus(skill: Skill.constituicao, bonus: 2),
        SkillBonus(skill: Skill.forcaOuDestreza, bonus: 2),
      ],
      startPowers: [Power.armaDedicada, Power.controleGravitacional],
      benefits: ['+1 Ataque Extra no 2º, 4º e 6º Ciclos', 'Ataque Desarmado'],
      typeIconAssetPath: 'assets/sheet/celestials/querubins/querubins.png',
    ),
    CharacterType.belial: CharacterClassDefinition(
      type: CharacterType.belial,
      name: 'Belial',
      description: 'Belials são os hábeis negociantes do Inferno, fazendo acordos com os mais gananciosos',
      lightAndDarkness: LightAndDarkness.darkness,
      possibleStrains: [Strain.gallu, Strain.negociante, Strain.sicario],
      skillsBonus: [
        SkillBonus(skill: Skill.carisma, bonus: 2),
        SkillBonus(skill: Skill.inteligencia, bonus: 1),
        SkillBonus(skill: Skill.sabedoria, bonus: 1)
      ],
      startPowers: [Power.abracadabra, Power.desatino, Power.duasCaras, Power.lerEmocoes, Power.psicometria, Power.remendo],
      benefits: ['Contrato', 'Recursos', 'Contatos'],
      typeIconAssetPath: 'assets/sheet/infernals/belials/belials.png'
    ),
  };
}