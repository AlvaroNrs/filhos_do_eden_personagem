import 'package:filhos_do_eden_personagem/app/model/strain_definition.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';

abstract class StrainCatalog {
  static const Map<Strain, StrainDefinition> strains = {
    Strain.legionario: StrainDefinition(
      strain: Strain.legionario,
      name: 'Legionário',
      description: 'Soldado da linha de frente nas batalhas, costumeiramente armado e disciplinado',
      avatarAssetPath: 'assets/sheet/celestials/querubins/querubins_legionario.png',
    ),
    Strain.shedu: StrainDefinition(
      strain: Strain.shedu,
      name: 'Shedu',
      description: 'Soldado da linha de frente nas batalhas, costumeiramente armado e disciplinado',
      avatarAssetPath: 'assets/sheet/celestials/querubins/querubins_shedus.png',
    ),
    Strain.erelim: StrainDefinition(
      strain: Strain.erelim,
      name: 'Erelim',
      description: 'Soldado da linha de frente nas batalhas, costumeiramente armado e disciplinado',
      avatarAssetPath: 'assets/sheet/celestials/querubins/querubins_erelins.png',
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
  };
}