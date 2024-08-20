import 'package:app/model/blot_entity.dart';

class InfoClient {
  final String id, name;
  final BlotEntity? blotEntity;
  const InfoClient({required this.id, required this.name,this.blotEntity});
}
