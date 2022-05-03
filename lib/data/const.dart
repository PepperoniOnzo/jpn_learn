class ConstData {
  static const int maxMatrix = 5;

  static const Map<String, String> hiragana = 
  {
    'あ': 'a', 'い': 'i', 'う': 'u', 'え': 'e', 'お': 'o',
    'か': 'ka', 'き': 'ki', 'く': 'ku', 'け': 'ke', 'こ': 'ko',
    'さ': 'sa', 'し': 'shi', 'す': 'su', 'せ': 'se', 'そ': 'so',
    'た': 'ta', 'ち': 'chi', 'つ': 'tsu', 'て': 'te', 'と': 'to',
    'な': 'na', 'に': 'ni', 'ぬ': 'nu', 'ね': 'ne', 'の': 'no',
    'は': 'ha', 'ひ': 'hi', 'ふ': 'fu', 'へ': 'he', 'ほ': 'ho',
    'ま': 'ma', 'み': 'mi', 'む': 'mu', 'め': 'me', 'も': 'mo',
    'や': 'ya', 'ゆ': 'yu', 'よ': 'yo',
    'ら': 'ra', 'り': 'ri', 'る': 'ru', 'れ': 're', 'ろ': 'ro',
    'わ': 'wa', 'を': 'wo', 'ん': 'n',
  };

  static const List<int> filterHiragana = [8, 8, 8, 8, 8, 6];
  
  static const List<int> kbdSizeTranscription = [10, 7, 8, 8, 7, 5];
  static const List<int> kbdLineTranscription = [0, 10, 17, 25, 33, 41];

  static const List<int> kbdSizeHiragana = [10, 10, 9, 9, 8];
  static const List<int> kbdLineHiragana = [0, 10, 20, 29, 38];
}