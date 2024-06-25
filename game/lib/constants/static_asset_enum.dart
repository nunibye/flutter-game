enum StaticAssetEnum {
  attackButton(assetName: 'attack_button.png'),
  background(assetName: 'background.png'),
  whiteMissile(assetName: 'white_missile.png');

  final String assetName;
  const StaticAssetEnum({required this.assetName});
}
