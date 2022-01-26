extension StringExt on String {
  List<num> toNumList() {
    var result = <num>[];
    var wordsList = split(' ');
    for (var word in wordsList) {
      var n = num.tryParse(word);
      if (n != null) result.add(n);
    }
    return result;
  }

  Set<int> toSetOfInt() {
    var dict = <String, num>{
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9,
      'zero': 0
    };
    var result = <int>{};
    var wordsList = split(',');
    for (var word in wordsList) {
      word = word.trim();
      if (dict.containsKey(word)) result.add(dict[word]);
    }
    return result;
  }
}
