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
      description: 'Querubins são soldados celestes inclinados ao combate que vivem um rígido código de honra',
      lightAndDarkness: LightAndDarkness.light,
      possibleStrains: [Strain.legionario, Strain.shedu, Strain.erelim],
      skillsBonus: [
        SkillBonus(skill: Skill.constituicao, bonus: 2),
        SkillBonus(skill: Skill.forcaOuDestreza, bonus: 2),
      ],
      startPowers: [Power.armaDedicada, Power.controleGravitacional, Power.reflexosRapidos, Power.sentidosAgucados, 
        Power.trilhaDoCacador, Power.ultimoSuspiro ],
      benefits: ['1 Ataque Extra no 2º Ciclo', '1 Ataque Extra no 4º Ciclo', '1 Ataque Extra no 6º Ciclo', 'Ataque Desarmado'],
      typeIconAssetPath: 'assets/sheet/celestials/querubins/querubins.png',
    ),

    CharacterType.seraphim: CharacterClassDefinition(
      type: CharacterType.seraphim,
      name: 'Seraphim',
      description: 'Seraphins são orgulhosos burocratas que evitam o plano físico e conduzem a política celeste',
      lightAndDarkness: LightAndDarkness.light,
      possibleStrains: [Strain.orador, Strain.militarista, Strain.surya],
      skillsBonus: [
        SkillBonus(skill: Skill.carisma, bonus: 2),
        SkillBonus(skill: Skill.inteligencia, bonus: 1),
        SkillBonus(skill: Skill.sabedoria, bonus: 1),
      ],
      startPowers: [Power.controlarOTecido, Power.lerEmocoes, Power.menteFechada, Power.miragem, Power.rasgoNaPsique,
        Power.telepatia ],
      benefits: ['Líder nato'],
      typeIconAssetPath: 'assets/sheet/celestials/serafins/serafins.png',
    ),

    CharacterType.elohim: CharacterClassDefinition(
      type: CharacterType.elohim,
      name: 'Elohim',
      description: 'Criados para manter as órbitas estelares, Elohins são clandestinos inclinados a não interferir no livre-arbítrio mortal',
      lightAndDarkness: LightAndDarkness.light,
      possibleStrains: [Strain.terrestre, Strain.zangao, Strain.militar],
      skillsBonus: [
        SkillBonus(skill: Skill.sabedoria, bonus: 2),
        SkillBonus(skill: Skill.inteligencia, bonus: 1),
        SkillBonus(skill: Skill.carisma, bonus: 1),
      ],
      startPowers: [Power.abracadabra, Power.duasCaras, Power.chumboGrosso, Power.desatino, Power.lerEmocoes,
        Power.sacoSemFundo ],
      benefits: ['Mascarar a aura', 'Recursos', 'Contatos'],
      typeIconAssetPath: 'assets/sheet/celestials/elohins/elohins.png',
    ),

    CharacterType.ofanim: CharacterClassDefinition(
      type: CharacterType.ofanim,
      name: 'Ofanim',
      description: 'Criados para gerar energia, Ofanins louvam e respeitam todas as criaturas, influenciando os humanos positivamente',
      lightAndDarkness: LightAndDarkness.light,
      possibleStrains: [Strain.missionario, Strain.shenzai, Strain.anjoDaGuarda],
      skillsBonus: [
        SkillBonus(skill: Skill.carisma, bonus: 2),
        SkillBonus(skill: Skill.sabedoria, bonus: 2),
      ],
      startPowers: [Power.companheiroAnimal, Power.lerEmocoes, Power.luz, Power.quebrarOPao, Power.refugioSeguro,
        Power.telepatia ],
      benefits: ['Santuário', 'Redenção'],
      typeIconAssetPath: 'assets/sheet/celestials/ofanins/ofanins.png',
    ),

    CharacterType.hashmalim: CharacterClassDefinition(
      type: CharacterType.hashmalim,
      name: 'Hashmalim',
      description: 'Criados para controlar a entropia, Hashmalins julgam e usam da dor para expiar as almas de seus pecados',
      lightAndDarkness: LightAndDarkness.light,
      possibleStrains: [Strain.algoz, Strain.magistrado, Strain.hashim],
      skillsBonus: [
        SkillBonus(skill: Skill.carisma, bonus: 2),
        SkillBonus(skill: Skill.sabedoria, bonus: 2),
      ],
      startPowers: [Power.controlarOTecido, Power.escuridao, Power.psicometria, Power.servoInvisivel, Power.sussuroDosMortos,
        Power.visaoDoAlem ],
      benefits: ['Provocar medo', 'Visão das trevas'],
      typeIconAssetPath: 'assets/sheet/celestials/hashmalins/hashmalins.png',
    ),

    CharacterType.ishim: CharacterClassDefinition(
      type: CharacterType.ishim,
      name: 'Ishim',
      description: 'Ishins governam as forças elementais, com grande poder e avessos à tecnologia humana',
      lightAndDarkness: LightAndDarkness.light,
      possibleStrains: [Strain.patrulheiro, Strain.djinn, Strain.elementalista],
      skillsBonus: [
        SkillBonus(skill: Skill.destreza, bonus: 2),
        SkillBonus(skill: Skill.sabedoria, bonus: 1),
        SkillBonus(skill: Skill.constituicao, bonus: 1),
      ],
      startPowers: [Power.companheiroAnimal, Power.conjurarElementos, Power.controleGravitacional,
      Power.gravitacao, Power.infravisao, Power.neblina ],
      benefits: ['(Um entre) Controle de temperatura / Corpo deslizante / Afinidade com a terra / Atmosfera particular'],
      typeIconAssetPath: 'assets/sheet/celestials/ishins/ishins.png',
    ),

    CharacterType.malakim: CharacterClassDefinition(
      type: CharacterType.malakim,
      name: 'Malakim',
      description: 'Obcecados por conhecimento, os Malakins observam, estudam e arquivam os passos dos mortais',
      lightAndDarkness: LightAndDarkness.light,
      possibleStrains: [Strain.erudito, Strain.escriba, Strain.kala],
      skillsBonus: [
        SkillBonus(skill: Skill.inteligencia, bonus: 2),
        SkillBonus(skill: Skill.sabedoria, bonus: 2),
      ],
      startPowers: [Power.levitar, Power.menteFechada, Power.psicometria,
      Power.remendo, Power.telepatia, Power.visaoDoAlem ],
      benefits: ['Especialização', 'Noção do tempo'],
      typeIconAssetPath: 'assets/sheet/celestials/malakins/malakins.png',
    ),


    
    CharacterType.malik: CharacterClassDefinition(
      type: CharacterType.malik,
      name: 'Malik',
      description: 'Malikis são lutadores sanguinários sem justiça, verdadeiras máquinas de guerra e guardiões infernais',
      lightAndDarkness: LightAndDarkness.darkness,
      possibleStrains: [Strain.azu, Strain.erinea, Strain.shaitan],
      skillsBonus: [
        SkillBonus(skill: Skill.constituicao, bonus: 2),
        SkillBonus(skill: Skill.forcaOuDestreza, bonus: 2)
      ],
      startPowers: [Power.armaDedicada, Power.controleGravitacional],
      benefits: ['1 Ataque Extra no 2º Ciclo', '1 Ataque Extra no 4º Ciclo', '1 Ataque Extra no 6º Ciclo', 'Ataque Desarmado'],
      typeIconAssetPath: 'assets/sheet/infernals/malikis/malikis.png'
    ),

    CharacterType.satanis: CharacterClassDefinition(
      type: CharacterType.satanis,
      name: 'Satanis',
      description: 'Satanis são perspicazes demônios burocratas, controladores que se consideram os mais civilizados do Sheol',
      lightAndDarkness: LightAndDarkness.darkness,
      possibleStrains: [Strain.copista, Strain.cavalariano, Strain.seraph],
      skillsBonus: [
        SkillBonus(skill: Skill.carisma, bonus: 2),
        SkillBonus(skill: Skill.inteligencia, bonus: 1),
        SkillBonus(skill: Skill.sabedoria, bonus: 1)
      ],
      startPowers: [Power.armaDedicada, Power.controlarOTecido, Power.lerEmocoes, Power.menteFechada,
      Power.telepatia, Power.servoInvisivel ],
      benefits: ['Líder nato'],
      typeIconAssetPath: 'assets/sheet/infernals/satanis/satanis.png'
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

    CharacterType.daimonium: CharacterClassDefinition(
      type: CharacterType.daimonium,
      name: 'Daimonium',
      description: 'Daimonius corrompem os mortais e não conseguem se materializar, atuando no plano físico por meio da possessão',
      lightAndDarkness: LightAndDarkness.darkness,
      possibleStrains: [Strain.nikibis, Strain.degenerado, Strain.montador],
      skillsBonus: [
        SkillBonus(skill: Skill.carisma, bonus: 2),
        SkillBonus(skill: Skill.sabedoria, bonus: 2)
      ],
      startPowers: [Power.escuridao, Power.gravitacao, Power.sentidosAgucados, Power.sussuroDosMortos, Power.telepatia,
      Power.visaoDoAlem],
      benefits: ['Possessão', 'Maus conselhos', 'Corpo de Trevas'],
      typeIconAssetPath: 'assets/sheet/infernals/daimonius/daimonius.png'
    ),

    CharacterType.baal: CharacterClassDefinition(
      type: CharacterType.baal,
      name: 'Baal',
      description: 'Baals são torturadores sádicos de almas, com o objetivo de quebrar o vínculo entre elas e a humanidade',
      lightAndDarkness: LightAndDarkness.darkness,
      possibleStrains: [Strain.verdugo, Strain.inquisidor, Strain.carceireiro],
      skillsBonus: [
        SkillBonus(skill: Skill.carisma, bonus: 2),
        SkillBonus(skill: Skill.constituicao, bonus: 2)
      ],
      startPowers: [Power.armaDedicada, Power.controlarOTecido, Power.escuridao, Power.infravisao, Power.servoInvisivel,
      Power.sussuroDosMortos],
      benefits: ['Causar dor', 'Visão das trevas'],
      typeIconAssetPath: 'assets/sheet/infernals/baals/baals.png'
    ),

    CharacterType.zanathus: CharacterClassDefinition(
      type: CharacterType.zanathus,
      name: 'Zanathus',
      description: 'Zanathus são demônios que governam as forças elementais deterioradas, inclinados a estragar a criação',
      lightAndDarkness: LightAndDarkness.darkness,
      possibleStrains: [Strain.regulador, Strain.khuraga, Strain.efreet],
      skillsBonus: [
        SkillBonus(skill: Skill.destreza, bonus: 2),
        SkillBonus(skill: Skill.sabedoria, bonus: 1),
        SkillBonus(skill: Skill.constituicao, bonus: 1),
      ],
      startPowers: [Power.armaDedicada, Power.controlarOTecido, Power.escuridao, Power.infravisao, Power.servoInvisivel,
      Power.sussuroDosMortos],
      benefits: ['(Um entre) Controle de temperatura / Corpo deslizante / Afinidade com a terra / Atmosfera particular'],
      typeIconAssetPath: 'assets/sheet/infernals/zanathus/zanathus.png'
    ),

    CharacterType.succubusIncubus: CharacterClassDefinition(
      type: CharacterType.succubusIncubus,
      name: 'Succubus/Incubus',
      description: 'Succubus e Incubus são galantes e charmosos que guardam intenções perversas e buscam corromper almas pela sedução',
      lightAndDarkness: LightAndDarkness.darkness,
      possibleStrains: [Strain.rabasha, Strain.yaksha, Strain.lamia],
      skillsBonus: [
        SkillBonus(skill: Skill.carisma, bonus: 2),
        SkillBonus(skill: Skill.sabedoria, bonus: 1),
        SkillBonus(skill: Skill.constituicao, bonus: 1),
      ],
      startPowers: [Power.abracadabra, Power.conjurarElementoFogo, Power.lerEmocoes, Power.sentidosAgucados, Power.servoInvisivel,
      Power.telepatia],
      benefits: ['Sedução', 'Beijo da morte'],
      typeIconAssetPath: 'assets/sheet/infernals/succubus_incubus/succubus_incubus.png'
    )
  };
}