class Artist {
  String name = '';
  String details = '';

  Artist.fromJSON(Map<String, dynamic> data) {
    if (data.containsKey('name')) {
      name = data['name'];
    }
    if (data.containsKey('details')) {
      details = data['details'];
    }
  }

  Artist.empty() {
    name = 'Empty';
    details = 'Empty';
  }
}
