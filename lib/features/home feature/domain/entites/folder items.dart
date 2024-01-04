class FolderItems {
  final String name;
  final int size;

  FolderItems(
    this.name,
    this.size,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FolderItems && name == other.name && size == other.size;

  @override
  int get hashCode => name.hashCode ^ size.hashCode;
}
