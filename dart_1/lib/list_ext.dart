extension ListExt on List {
  Map<String, int> toMapWithCnt() {
    if (this is List<String>) {
      var result = <String, int>{};
      for (var word in this) {
        if (result.containsKey(word)) {
          result[word]++;
        } else {
          result[word] = 1;
        }
      }
      return result;
    } else {
      throw ArgumentError('Arg must be a list of strings');
    }
  }
}
