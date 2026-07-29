import 'package:filhos_do_eden_personagem/app/model/power_definition.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/power.dart';

abstract class PowerCatalog {
  static const Map<Power, PowerDefinition> powers = {
    Power.abracadabra: PowerDefinition(name: 'Abracadabra'),
    Power.armaDedicada: PowerDefinition(name: 'Arma Dedicada'),
    Power.chumboGrosso: PowerDefinition(name: 'Chumbo Grosso'),
    Power.conjurarElementos: PowerDefinition(name: 'Conjurar Elementos'),
    Power.conjurarElementoFogo: PowerDefinition(name: 'Conjurar Elemento (Fogo)'),
    Power.companheiroAnimal: PowerDefinition(name: 'Companheiro Animal'),
    Power.controlarOTecido: PowerDefinition(name: 'Controlar o Tecido'),
    Power.controleGravitacional: PowerDefinition(name: 'Controle Gravitacional'),
    Power.desatino: PowerDefinition(name: 'Desatino'),
    Power.duasCaras: PowerDefinition(name: 'Duas Caras'),
    Power.escuridao: PowerDefinition(name: 'Escuridão'),
    Power.gravitacao: PowerDefinition(name: 'Gravitação'),
    Power.infravisao: PowerDefinition(name: 'Infravisão'),
    Power.lerEmocoes: PowerDefinition(name: 'Ler Emoções'),
    Power.levitar: PowerDefinition(name: 'Levitar'),
    Power.luz: PowerDefinition(name: 'Luz'),
    Power.menteFechada: PowerDefinition(name: 'Mente Fechada'),
    Power.miragem: PowerDefinition(name: 'Miragem'),
    Power.neblina: PowerDefinition(name: 'Neblina'),
    Power.psicometria: PowerDefinition(name: 'Psicometria'),
    Power.quebrarOPao: PowerDefinition(name: 'Quebrar o Pão'),
    Power.rasgoNaPsique: PowerDefinition(name: 'Rasgo na Psique'),
    Power.reflexosRapidos: PowerDefinition(name: 'Relflexos Rápidos'),
    Power.refugioSeguro: PowerDefinition(name: 'Refúgio Seguro'),
    Power.remendo: PowerDefinition(name: 'Remendo'),
    Power.sacoSemFundo: PowerDefinition(name: 'Saco sem Fundo'),
    Power.sentidosAgucados: PowerDefinition(name: 'Sentidos Aguçados'),
    Power.servoInvisivel: PowerDefinition(name: 'Servo Invisível'),
    Power.sussuroDosMortos: PowerDefinition(name: 'Sussuro dos Mortos'),
    Power.telepatia: PowerDefinition(name: 'Telepatia'),
    Power.trilhaDoCacador: PowerDefinition(name: 'Trilha do Caçador'),
    Power.ultimoSuspiro: PowerDefinition(name: 'Último Susupiro'),
    Power.visaoDoAlem: PowerDefinition(name: 'Visão do Além'),
  };
}

extension PowerX on Power {
  PowerDefinition get definition => PowerCatalog.powers[this]!;
}

// Exemplo de uso na tela/UI:
// Text(Power.armaDedicada.definition.name);