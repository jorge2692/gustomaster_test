import 'package:hive/hive.dart';

part 'weight.g.dart';

@HiveType(typeId: 3)
class Weight extends HiveObject{
  @HiveField(0)
  final String imperial;
  @HiveField(1)
  final String metric;

  Weight({
    required this.imperial,
    required this.metric
    }
  );
  factory Weight.fromJson(Map<String, dynamic>json){
    return Weight(
        imperial: json['imperial'],
        metric: json['metric']
    );
  }

}