import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';

class StrainDefinition {
  final Strain strain;
  final String name;
  final String description;
  final String avatarAssetPath;

  const StrainDefinition({
    required this.strain,
    required this.name,
    required this.description,
    required this.avatarAssetPath,
  });
}