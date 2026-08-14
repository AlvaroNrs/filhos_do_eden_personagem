import 'package:filhos_do_eden_personagem/app/model/side_definition.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';

abstract class SideCatalog {
  static const Map<LightAndDarkness, SideDefinition> sides = {
    LightAndDarkness.light: SideDefinition(name: "Angélico", 
      description: "Você pertence a uma das castas angélicas originais, ao lado de Miguel ou Gabriel"),
    LightAndDarkness.darkness: SideDefinition(name: "Infernal", 
      description: "Você pertence a uma das ordens infernais, tendo decaído devido a Lúficer"),
  };
}