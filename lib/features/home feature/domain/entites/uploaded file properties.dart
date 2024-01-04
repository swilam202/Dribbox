class UploadedFileProperties {
  final String name;
  final String type;
  final String url;
  final int size;

  const UploadedFileProperties(
    this.name,
    this.type,
    this.url,
    this.size,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadedFileProperties &&
          name == other.name &&
          size == other.size &&
          url == other.url &&
          type == other.type;

  @override
  int get hashCode =>
      name.hashCode ^ size.hashCode ^ url.hashCode ^ type.hashCode;
}
