String calculateSize(int bytes) {
  double size;

  if (bytes >= 1099511627776) {
    size = bytes / 1099511627776;
    return '$size GB';
  } else if (bytes >= 1048576) {
    size = bytes / 1048576;
    return '$size MB';
  } else if (bytes >= 1024) {
    size = bytes / 1024;
    return '$size KB';
  } else {
    return '$bytes Byte';
  }
}
