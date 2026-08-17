import 'package:filhos_do_eden_personagem/app/model/strain_definition.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';

abstract class StrainCatalog {
  static const Map<Strain, StrainDefinition> strains = {
    Strain.legionario: StrainDefinition(
      strain: Strain.legionario,
      name: 'Legionário',
      description: 'Soldado da linha de frente nas batalhas, costumeiramente armado e disciplinado',
      avatarAssetPath: 'assets/sheet/celestials/querubins/querubins_legionarios.png',
    ),
    Strain.shedu: StrainDefinition(
      strain: Strain.shedu,
      name: 'Shedu',
      description: 'Caçador feroz voltado a seus instintos, com forma de animal e sentidos apurados',
      avatarAssetPath: 'assets/sheet/celestials/querubins/querubins_shedus.png',
    ),
    Strain.erelim: StrainDefinition(
      strain: Strain.erelim,
      name: 'Erelim',
      description: 'Guardião frio dos palácios celestes que não se envolve em lutas desnecessárias',
      avatarAssetPath: 'assets/sheet/celestials/querubins/querubins_erelins.png',
    ),

    Strain.orador: StrainDefinition(
      strain: Strain.orador,
      name: 'Orador',
      description: 'Político que atua como secretário dos arcanjos e administrador das cidades celestes',
      avatarAssetPath: 'assets/sheet/celestials/serafins/serafins_oradores.png',
    ),
    Strain.militarista: StrainDefinition(
      strain: Strain.militarista,
      name: 'Militarista',
      description: 'Planejador e estrategista que usa de suas capacidades para traçar planos de conquista',
      avatarAssetPath: 'assets/sheet/celestials/serafins/serafins_militaristas.png',
    ),
    Strain.surya: StrainDefinition(
      strain: Strain.surya,
      name: 'Surya',
      description: 'Arquiteto que já ajudou na construção do cosmo e hoje auxilia em sua manutenção',
      avatarAssetPath: 'assets/sheet/celestials/serafins/serafins_suryas.png',
    ),

    Strain.terrestre: StrainDefinition(
      strain: Strain.terrestre,
      name: 'Terrestre',
      description: 'Político que atua como secretário dos arcanjos e administrador das cidades celestes',
      avatarAssetPath: 'assets/sheet/celestials/elohins/elohins_terrestres.png',
    ),
    Strain.zangao: StrainDefinition(
      strain: Strain.zangao,
      name: 'Zangão',
      description: 'Mantenedor que vaga pela zona secreta e bordas do limbo, consertando e cavando túneis',
      avatarAssetPath: 'assets/sheet/celestials/elohins/elohins_zangoes.png',
    ),
    Strain.militar: StrainDefinition(
      strain: Strain.militar,
      name: 'Militar',
      description: 'Responsável pela segurança da casta que treina com armas de fogo e ações táticas',
      avatarAssetPath: 'assets/sheet/celestials/elohins/elohins_militares.png',
    ),

    Strain.missionario: StrainDefinition(
      strain: Strain.missionario,
      name: 'Missionário',
      description: 'Andarilho do mundo físico que ajuda causas humanitárias como pessoas ou animais, oferecendo conforto',
      avatarAssetPath: 'assets/sheet/celestials/ofanins/ofanins_missionarios.png',
    ),
    Strain.shenzai: StrainDefinition(
      strain: Strain.shenzai,
      name: 'Shenzai',
      description: 'Viajante dos plano espiritual com a missão arriscada de redimir os fantasmas',
      avatarAssetPath: 'assets/sheet/celestials/ofanins/ofanins_shenzais.png',
    ),
    Strain.anjoDaGuarda: StrainDefinition(
      strain: Strain.anjoDaGuarda,
      name: 'Anjo da Guarda',
      description: 'Guia espiritual invisível dos humanos, inspirando bons conselhos e os protegendo das forças infernais',
      avatarAssetPath: 'assets/sheet/celestials/ofanins/ofanins_anjos_da_guarda.png',
    ),

    Strain.algoz: StrainDefinition(
      strain: Strain.algoz,
      name: 'Algoz',
      description: 'Torturador que redime espíritos pela dor e sofrimento, trabalhando pela salvação das almas',
      avatarAssetPath: 'assets/sheet/celestials/hashmalins/hashmalins_algozes.png',
    ),
    Strain.magistrado: StrainDefinition(
      strain: Strain.magistrado,
      name: 'Magistrado',
      description: 'Acolhedor das almas nos tribunais do purgatório, determinando a sentença delas',
      avatarAssetPath: 'assets/sheet/celestials/hashmalins/hashmalins_magistrados.png',
    ),
    Strain.hashim: StrainDefinition(
      strain: Strain.hashim,
      name: 'Hashim',
      description: 'Caçador de espíritos foragidos no plano astral ou das sombras, além de guardião da Gehenna',
      avatarAssetPath: 'assets/sheet/celestials/hashmalins/hashmalins_hashins.png',
    ),

    Strain.patrulheiro: StrainDefinition(
      strain: Strain.patrulheiro,
      name: 'Patrulheiro',
      description: 'Defensor da natureza ligado às plantas e animais, além de caçador dos que ameaçam os recursos naturais',
      avatarAssetPath: 'assets/sheet/celestials/ishins/ishins_patrulheiros.png',
    ),
    Strain.djinn: StrainDefinition(
      strain: Strain.djinn,
      name: 'Djinn',
      description: 'Artífice habilidoso que usa de seu talento para construir objetos e edifícios celestes',
      avatarAssetPath: 'assets/sheet/celestials/ishins/ishins_djinns.png',
    ),
    Strain.elementalista: StrainDefinition(
      strain: Strain.elementalista,
      name: 'Elementalista',
      description: 'Ishim mais comum e numeroso, manipulando e moldando as forças dos quatro elementos',
      avatarAssetPath: 'assets/sheet/celestials/ishins/ishins_elementalistas.png',
    ),

    Strain.erudito: StrainDefinition(
      strain: Strain.erudito,
      name: 'Erudito',
      description: 'Estudioso reservado e perfeccionista do universo, terra e seres humanos a partir de suas câmaras e bibliotecas ',
      avatarAssetPath: 'assets/sheet/celestials/malakins/malakins_eruditos.png',
    ),
    Strain.escriba: StrainDefinition(
      strain: Strain.escriba,
      name: 'Escriba',
      description: 'Tradutor das anotações dos eruditos para belas palavras, que se preocupa mais como os fatos são contados',
      avatarAssetPath: 'assets/sheet/celestials/malakins/malakins_escribas.png',
    ),
    Strain.kala: StrainDefinition(
      strain: Strain.kala,
      name: 'Kãla',
      description: 'Arqueólogo que vaga pelo cosmo recolhendo informações do tempo e espaço, vez ou outra as compartilhando com outros',
      avatarAssetPath: 'assets/sheet/celestials/malakins/malakins_kalas.png',
    ),


    Strain.azu: StrainDefinition(
      strain: Strain.azu,
      name: 'Azu',
      description: 'Guerreiro insano ávido por esmagar e matar, indisciplinado com resistência e força física altas',
      avatarAssetPath: 'assets/sheet/infernals/malikis/malikis_azus.png',
    ),
    Strain.erinea: StrainDefinition(
      strain: Strain.erinea,
      name: 'Erínea',
      description: 'Arqueira cruel, talentosa e sádica que abate e extermina suas presas do alto com flechas',
      avatarAssetPath: 'assets/sheet/infernals/malikis/malikis_erineas.png',
    ),
    Strain.shaitan: StrainDefinition(
      strain: Strain.shaitan,
      name: 'Shaitan',
      description: 'Devorador de almas com corpo animalesco que passa pelas trincheiras devorando oponentes feridos',
      avatarAssetPath: 'assets/sheet/infernals/malikis/malikis_shaitans.png',
    ),

    Strain.copista: StrainDefinition(
      strain: Strain.copista,
      name: 'Copista',
      description: 'Burocrata infernal que atua como escrivão e secretário de seus senhores nos tribunais e bibliotecas',
      avatarAssetPath: 'assets/sheet/infernals/satanis/satanis_copistas.png',
    ),
    Strain.cavalariano: StrainDefinition(
      strain: Strain.erinea,
      name: 'Cavalariano',
      description: 'Cavaleiro feudal infernal que luta montado e segue rígidos códigos de conduta',
      avatarAssetPath: 'assets/sheet/infernals/satanis/satanis_cavalarianos.png',
    ),
    Strain.seraph: StrainDefinition(
      strain: Strain.seraph,
      name: 'Séraph',
      description: 'Líder político que prefere governar não pela violência, mas pela intriga, retórica e diplomacia',
      avatarAssetPath: 'assets/sheet/infernals/satanis/satanis_seraphs.png',
    ),

    Strain.gallu: StrainDefinition(
      strain: Strain.gallu,
      name: 'Gallus',
      description: 'Vigia de cofres e lares dos magnatas satânicos, que impede roubos e invasões',
      avatarAssetPath: 'assets/sheet/infernals/belials/belials_gallus.png',
    ),
    Strain.negociante: StrainDefinition(
      strain: Strain.negociante,
      name: 'Negociante',
      description: 'Visitante que vem à terra oferecer contratos aos mortais em troca de pagamento',
      avatarAssetPath: 'assets/sheet/infernals/belials/belials_negociantes.png',
    ),
    Strain.sicario: StrainDefinition(
      strain: Strain.sicario,
      name: 'Sicário',
      description: 'Capanga dos negociantes infernais, enviado para recolher as dívidas dos contratos',
      avatarAssetPath: 'assets/sheet/infernals/belials/belials_sicarios.png',
    ),

    Strain.nikibis: StrainDefinition(
      strain: Strain.nikibis,
      name: 'Nikibis',
      description: 'Andarilho do plano astral que sussurra conselhos ruins e tentações, incentivando sentimentos nefastos',
      avatarAssetPath: 'assets/sheet/infernals/daimonius/daimonius_nikibis.png',
    ),
    Strain.degenerado: StrainDefinition(
      strain: Strain.degenerado,
      name: 'Degenerado',
      description: 'Obsessor que estuda e acentua vícios de narcóticos em humanos para submetê-los a si',
      avatarAssetPath: 'assets/sheet/infernals/daimonius/daimonius_degenerados.png',
    ),
    Strain.montador: StrainDefinition(
      strain: Strain.montador,
      name: 'Montador',
      description: 'Quebrador da força de vontade humana para tomar um corpo para si, podendo habitar alguém por anos',
      avatarAssetPath: 'assets/sheet/infernals/daimonius/daimonius_montadores.png',
    ),

    Strain.verdugo: StrainDefinition(
      strain: Strain.verdugo,
      name: 'Verdugo',
      description: 'Maioria entre os baals, inflige o máximo de dor, sofrimento e angústia em quem cai em suas mãos',
      avatarAssetPath: 'assets/sheet/infernals/baals/baals_verdugos.png',
    ),
    Strain.inquisidor: StrainDefinition(
      strain: Strain.inquisidor,
      name: 'Inquisidor',
      description: 'Fiscal de outros demônios, vigiando outras castas e os denunciando ao Tribunal das Correntes',
      avatarAssetPath: 'assets/sheet/infernals/baals/baals_inquisidores.png',
    ),
    Strain.carceireiro: StrainDefinition(
      strain: Strain.carceireiro,
      name: 'Carceireiro',
      description: 'Segurança das câmaras de tortura, vigiando seus corredores e portões',
      avatarAssetPath: 'assets/sheet/infernals/baals/baals_carceireiros.png',
    ),

    Strain.regulador: StrainDefinition(
      strain: Strain.regulador,
      name: 'Regulador',
      description: 'Controlador orgulhoso do clima dos círculos infernais, responsável por tornar o inferno habitável',
      avatarAssetPath: 'assets/sheet/infernals/zanathus/zanathus_reguladores.png',
    ),
    Strain.khuraga: StrainDefinition(
      strain: Strain.khuraga,
      name: 'Khurãga',
      description: 'Figura atroz que incorpora o lado macabro das forças animais, tendo forma de bestas selvagens',
      avatarAssetPath: 'assets/sheet/infernals/zanathus/zanathus_khuragas.png',
    ),
    Strain.efreet: StrainDefinition(
      strain: Strain.efreet,
      name: 'Efreet',
      description: 'Demônio artesão que construi fortalezas satânicas e objetos místicos para demônios de alta hirerarquia',
      avatarAssetPath: 'assets/sheet/infernals/zanathus/zanathus_efreets.png',
    ),

    Strain.rabasha: StrainDefinition(
      strain: Strain.rabasha,
      name: 'Rabasha',
      description: 'Sedutor com aparência belíssima que copula com mortais e suga suas energias',
      avatarAssetPath: 'assets/sheet/infernals/succubus_incubus/succubus_incubus_rabashas.png',
    ),
    Strain.yaksha: StrainDefinition(
      strain: Strain.yaksha,
      name: 'Yaksha',
      description: 'Sedutor que incita ao delírio e ao exagero das emoções, libido e euforia criativa',
      avatarAssetPath: 'assets/sheet/infernals/succubus_incubus/succubus_incubus_yakshas.png',
    ),
    Strain.lamia: StrainDefinition(
      strain: Strain.lamia,
      name: 'Lâmia',
      description: 'Andarilha insaciável do primeiro círculo infernal, que literalmente devora órgãos sexuais masculinos',
      avatarAssetPath: 'assets/sheet/infernals/succubus_incubus/succubus_incubus_lamias.png',
    ),
  };
}