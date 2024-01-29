String calculateSize(int bytes) {
  double size;

  if (bytes >= 1073741824) {
    size = bytes / 1073741824;
    return '${size.toStringAsFixed(2)} GB';
  } else if (bytes >= 1048576) {
    size = bytes / 1048576;
    return '${size.toStringAsFixed(2)} MB';
  } else if (bytes >= 1024) {
    size = bytes / 1024;
    return '${size.toStringAsFixed(2)} KB';
  } else {
    size = bytes.toDouble();
    return '${size.toStringAsFixed(2)} Byte';
  }
}
