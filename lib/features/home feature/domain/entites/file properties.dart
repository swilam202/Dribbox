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
}
