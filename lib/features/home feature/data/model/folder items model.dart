import 'package:dribbox/features/home%20feature/domain/entites/folder%20items.dart';

class FolderItemsModel extends FolderItems {
  FolderItemsModel(
    super.name,
    super.url,
    super.size,
  );

  factory FolderItemsModel.fromMap(Map<String, dynamic> map) {
    return FolderItemsModel(
      map['name'],
      map['url'],
      map['size'],
    );
  }
}
