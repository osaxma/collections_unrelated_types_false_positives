// `dart:io` type mock
class FileEntitySystemIO {}

class FileIO implements FileEntitySystemIO {}

// `package:file` type mock
class FileEntitySystemFilePkg implements FileEntitySystemIO {}

class FileFilePkg implements FileIO, FileEntitySystemFilePkg {}

void main() {
  <FileEntitySystemFilePkg>[].contains(FileIO());
  //                                   ^^^^^^^^
  //      The argument type 'FileIO' isn't related to 'FileEntitySystemFilePkg'
  //
  // Although: `FileIO` is! `FileEntitySystemFilePkg`, `FileFilePkg` is both
  //            `FileIO` and `FileEntitySystemFilePkg`
}
