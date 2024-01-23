String firebaseExceptionCodes(String code) {
  switch (code) {
    case 'invalid-phone-number':
      return 'Invalid phone number';
    case 'phone-number-already-exists':
      return 'Phone number already in use';
    case 'internal-error':
      return 'Something went wrong, please try again!';
    case 'too-many-requests':
      return 'you tried too many times, please try again later';
    case 'network-request-failed':
      return 'Connection error, please check your connection';
    default:
      return code;
  }
}
