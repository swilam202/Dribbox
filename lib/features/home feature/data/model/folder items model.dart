

import '../../../../core/models/folder items.dart';
import 'folder items.dart';

class FolderItemsModel extends FolderItems {
  FolderItemsModel(
    super.name,
    super.url,
    super.size,
      super.type,
  );

  factory FolderItemsModel.fromMap(Map<String, dynamic> map) {
    return FolderItemsModel(
      map['name'],
      map['url'],
      map['size'],
      map['type'],
    );
  }
}
