enum Skill {
  forca('Força'),
  destreza('Detreza'),
  constituicao('Constituição'),
  inteligencia('Inteligência'),
  sabedoria('Sabedoria'),
  carisma('Carisma'),
  forcaOuDestreza('Força / Destreza');

  const Skill(this.name);
  final String name;
}