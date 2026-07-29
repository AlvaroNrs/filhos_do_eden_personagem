import 'package:filhos_do_eden_personagem/app/model/skill_bonus.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/model/power.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/skill.dart';

enum SheetData {
  querubim(lightAndDarkness: LightAndDarkness.light, typeName: 'Querubim',
    description: 'Querubins são soldados celestes inclinados ao combate que vivem um rígido código de honra',
    strains: {
      'Legionário' : 'Soldado da linha de frente nas batalhas, costumeiramente armado e disciplinado',
      'Shedu' : 'Caçador feroz voltado a seus instintos, com forma de animal e sentidos apurados ',
      'Erelim' : 'Guardião frio dos palácios celestes que não se envolve em lutas desnecessárias'
    },
    skillsBonus: [
      SkillBonus(skill: Skill.constituicao, bonus: 2),
      SkillBonus(skill: Skill.forcaOuDestreza, bonus: 2),
    ],
    startPowers: [ Power.armaDedicada, Power.controleGravitacional, Power.reflexosRapidos, Power.sentidosAgucados,
    Power.trilhaDoCacador, Power.ultimoSuspiro ],
    benefits: [ '+1 Ataque Extra no 2º, 4º e 6º Ciclos', 'Ataque Desarmado' ]
  ),
  belial(lightAndDarkness: LightAndDarkness.darkness, typeName: 'Belial',
    description: 'Visitante que vem à terra oferecer contratos aos mortais em troca de pagamento ',
    strains: {
      'Gallu' : 'Vigia de cofres e lares dos magnatas satânicos, que impede roubos e invasões',
      'Negociante' : 'Visitante que vem à terra oferecer contratos aos mortais em troca de pagamento ',
      'Sicário' : 'Capanga dos negociantes infernais, enviado para recolher as  dívidas dos contratos'
    },
    skillsBonus: [
      SkillBonus(skill: Skill.carisma, bonus: 2),
      SkillBonus(skill: Skill.inteligencia, bonus: 1),
      SkillBonus(skill: Skill.sabedoria, bonus: 1)
    ],
    startPowers: [ Power.abracadabra, Power.desatino, Power.duasCaras, Power.lerEmocoes, Power.psicometria,
      Power.remendo ],
    benefits: [ 'Contrato', 'Recursos', 'Contatos' ]
  );

  const SheetData({required this.lightAndDarkness, required this.typeName, required this.description, required this.strains,
    required this.startPowers, required this.benefits, required this.skillsBonus});

  final LightAndDarkness lightAndDarkness;
  final String typeName;
  final String description;
  final Map<String, String> strains;
  final List<SkillBonus> skillsBonus;
  final List<Power> startPowers;
  final List<String> benefits;
}