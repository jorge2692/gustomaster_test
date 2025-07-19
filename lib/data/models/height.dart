class Height{
  final String imperial;
  final String metric;

  Height({
    required this.imperial,
    required this.metric
    }
  );

  factory Height.fromJson(Map<String, dynamic>json){
    return Height(
        imperial: json['imperial'],
        metric: json['metric']
    );
  }

}