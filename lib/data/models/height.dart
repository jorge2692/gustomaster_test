import 'package:hive/hive.dart';

part 'height.g.dart';

@HiveType(typeId: 1)
class Height extends HiveObject{
  @HiveField(0)
  final String imperial;
  @HiveField(1)
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