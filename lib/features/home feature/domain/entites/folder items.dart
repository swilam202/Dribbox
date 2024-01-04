class FolderItems {
  final String name;
  final String url;
  final int size;

  const FolderItems(
    this.name,
    this.url,
    this.size,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FolderItems && name == other.name && size == other.size && url == other.url;

  @override
  int get hashCode => name.hashCode ^ size.hashCode ^ url.hashCode;
}
