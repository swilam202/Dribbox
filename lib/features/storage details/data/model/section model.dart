import 'package:dribbox/features/storage%20details/domain/entites/section.dart';

class SectionModel extends Section{
  SectionModel(super.title, super.value, super.color,);

  /*factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      map['title'],
      map['value'],
      map['color'],
    );
  }*/

}