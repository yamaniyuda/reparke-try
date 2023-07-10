class Helper {
  String mapToString( String annotation, Map<String, dynamic> map) {
    late List<String> pairs = [];
    map.forEach((key, value) {
      final String pair = "$key=$value";
      pairs.add(pair);
    });

    return pairs.join(annotation);
  }
}