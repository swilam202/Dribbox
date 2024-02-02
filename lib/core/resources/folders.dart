import 'package:flutter/material.dart';

abstract class FolderProperties {
  abstract final int id;
  abstract final String name;
  abstract final Color color;
  abstract final IconData icon;
  abstract final List<String> types;
}

class APKFolderProperties extends FolderProperties {
  @override
  Color get color => Colors.green;

  @override
  int get id => 1;

  @override
  String get name => 'Mobile apps';

  @override
  List<String> get types => ['apk'];

  @override
  IconData get icon => Icons.android;
}

class ProgrammingFolderProperties extends FolderProperties {
  @override
  Color get color => Colors.indigo;

  @override
  int get id => 2;

  @override
  String get name => 'Programming';

  @override
  List<String> get types => [
        'html',
        'cpp',
        'java',
        'dart',
        'css',
        'js',
        'kt',
        'py',
        'c',
        'php',
        'ipymb',
        'ipynb',
        'json',
        'xml',
        'yml',
        'yaml',
        'sql',
      ];

  @override
  IconData get icon => Icons.code;
}

class FilesFolderProperties extends FolderProperties {
  @override
  Color get color => Colors.amber;

  @override
  int get id => 3;

  @override
  String get name => 'Files';

  @override
  List<String> get types => [
        'txt',
        'pdf',
        'pptx',
        'xlsx',
        'docx',
        'doc',
        'ppt',
        'xls',
        'csv',
        'rtf',
      ];

  @override
  IconData get icon => Icons.file_copy_outlined;
}

class AudioFolderProperties extends FolderProperties {
  @override
  Color get color => Colors.orange;

  @override
  int get id => 4;

  @override
  String get name => 'Audio';

  @override
  List<String> get types => [
        'mp3',
        'lrc',
        'm4a',
        'wav',
        'wma',
      ];

  @override
  IconData get icon => Icons.music_note;
}

class VideosFolderProperties extends FolderProperties {
  @override
  Color get color => Colors.blue;

  @override
  int get id => 5;

  @override
  String get name => 'Videos';

  @override
  List<String> get types => [
        'mp4',
        'webm',
        'mkv',
        'mov',
        'wmv',
        'flv',
        'm4v',
      ];

  @override
  IconData get icon => Icons.ondemand_video;
}

class ImagesFolderProperties extends FolderProperties {
  @override
  Color get color => Colors.red;

  @override
  int get id => 6;

  @override
  String get name => 'Images';

  @override
  List<String> get types => [
        'jpeg',
        'jpg',
        'png',
        'gif',
        'psd',
        'svg',
        'webp',
      ];

  @override
  IconData get icon => Icons.image;
}

class ArchiveFolderProperties extends FolderProperties {
  @override
  Color get color => Colors.teal;

  @override
  int get id => 7;

  @override
  String get name => 'Archive';

  @override
  List<String> get types => [
        'zip',
        'rar',
        'rar4',
      ];

  @override
  IconData get icon => Icons.archive_rounded;
}

class OtherFolderProperties extends FolderProperties {
  @override
  Color get color => Colors.grey;

  @override
  int get id => 8;

  @override
  String get name => 'Other';

  @override
  List<String> get types => [];

  @override
  IconData get icon => Icons.file_present;
}
