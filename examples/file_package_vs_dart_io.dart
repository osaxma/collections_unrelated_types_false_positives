import 'dart:io' as io;
import 'package:file/file.dart';
import 'package:file/local.dart';

// To examine the false positive, you need to build the sdk using the following
// patchset: https://dart-review.googlesource.com/c/sdk/+/352220
//
// Then run:
// ```
// path/to/local/sdk/dart analyze path/to/this/file
// ````
void main() {
  // Note: both `LocalFileSystem` and `FileSystemEntity` from `package:file`
  final someFile = LocalFileSystem().file('somefile');
  final files = <FileSystemEntity>[someFile].whereType<io.File>().toList();
  //                                                   ^^^^^^^
  //                                          false positive warning here
  // Warning:
  // The argument type 'File' isn't related to 'Iterable<FileSystemEntity>'.
  // dart.(collection_methods_unrelated_type)
  //
  print(files.length); // prints: 1
}
