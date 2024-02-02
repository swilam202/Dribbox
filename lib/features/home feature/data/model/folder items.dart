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
      other is FolderItems &&
          name == other.name &&
          size == other.size &&
          url == other.url &&
          type == other.type;

  @override
  int get hashCode =>
      name.hashCode ^ size.hashCode ^ url.hashCode ^ type.hashCode;
}
