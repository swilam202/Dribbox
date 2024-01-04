import 'dart:io';

class FileProperties {
  final File file;
  final String name;
  final String extension;
  final int size;

  FileProperties(
    this.file,
    this.name,
    this.extension,
    this.size,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileProperties &&
          file == other.file &&
          extension == other.extension &&
          size == other.size &&
          name == other.name;

  @override
  int get hashCode =>
      file.hashCode ^ name.hashCode ^ extension.hashCode ^ size.hashCode;
}
