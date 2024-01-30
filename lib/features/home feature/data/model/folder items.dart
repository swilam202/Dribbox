import 'package:dribbox/core/utils/calculate%20size.dart';

class FolderItems {
  final String name;
  final String url;
  final String type;
  final int size;

  const FolderItems(
      this.name,
      this.url,
      this.size,
      this.type,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FolderItems && name == other.name && size == other.size && url == other.url && type == other.type;

  @override
  int get hashCode => name.hashCode ^ size.hashCode ^ url.hashCode ^ type.hashCode;

  @override
  String toString ()=>'name: $name \n type: $type \n size: ${calculateSize(size)} \n url: $url';
}