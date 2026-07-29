enum LightAndDarkness {
  light(side: 'Celestial', description: 'Você pertence a uma das castas angélicas originais, ao lado de Miguel ou Gabriel'),
  darkness(side: 'Infernal', description: 'Você pertence a uma das ordens infernais, tendo decaído junto a Lúficer' );

  const LightAndDarkness({required this.side, required this.description});

  final String side;
  final String description;
}