This repository contains a collection of false poisitive that were found during the submission of the following CL:

- [[pkg/linter]: Add Iterable.whereType to collection_methods_unrelated_type](https://dart-review.googlesource.com/c/sdk/+/351781)
    > Warn when a type argument `T` in `Iterable<E>.whereType<T>` is not related to `E`


1. The following two false positives were found in `flutter` related repositories (at least the public ones):
    - CI Logs ([link](https://logs.chromium.org/logs/dart/buildbucket/cr-buildbucket/8756187026038770497/+/u/analyze_flutter_flutter/stdout)):
    ```
    Analyzing flutter...                                            

    info • The argument type 'File' isn't related to 'Iterable<FileSystemEntity>' • dev/customer_testing/run_tests.dart:88:16 • collection_methods_unrelated_type
    info • The argument type 'DevFSFileContent' isn't related to 'Iterable<AssetBundleEntry>' • packages/flutter_tools/lib/src/commands/test.dart:613:67 • collection_methods_unrelated_type

    2 issues found. (ran in 226.9s)
    ```
    - [examples/file_package_vs_dart_io.dart](examples/file_package_vs_dart_io.dart) contains a minimal example to the first false positive extracted from [`flutter/dev/customer_testing`](https://github.com/flutter/flutter/blob/295eeaf100f098f1998428851e0d6a8213e033e3/dev/customer_testing/run_tests.dart#L88).

2. The following false poistives (still haven't confirmed if they are) were found in `pkg/analysis_server`:
    - CI Logs: ([link](https://logs.chromium.org/logs/dart/buildbucket/cr-buildbucket/8756187043664915905/+/u/analyze_pkg_/stdout))
    ```

    Analyzing pkg...

        info - analysis_server/lib/src/services/correction/dart/convert_to_if_case_statement_chain.dart:89:22 - The argument type 'SwitchPatternCase' isn't related to 'Iterable<SwitchMemberImpl>'. - collection_methods_unrelated_type

        info - analysis_server/lib/src/services/refactoring/agnostic/change_method_signature.dart:673:28 - The argument type 'ExecutableElement' isn't related to 'Iterable<ClassMemberElement>'. - collection_methods_unrelated_type

        info - analyzer/lib/src/dart/analysis/file_state.dart:956:26 - The argument type 'ConstructorDeclaration' isn't related to 'Iterable<ClassMemberImpl>'. - collection_methods_unrelated_type

        info - analyzer/lib/src/dart/analysis/library_analyzer.dart:803:20 - The argument type 'LibraryDirective' isn't related to 'Iterable<DirectiveImpl>'. - collection_methods_unrelated_type

        info - analyzer/lib/src/summary2/macro_application.dart:994:22 - The argument type 'ConstructorDeclaration' isn't related to 'Iterable<DeclarationImpl>'. - collection_methods_unrelated_type

        info - analyzer/lib/src/summary2/macro_application.dart:1012:22 - The argument type 'FieldDeclaration' isn't related to 'Iterable<DeclarationImpl>'. - collection_methods_unrelated_type

        info - analyzer/lib/src/summary2/macro_application.dart:1033:22 - The argument type 'MethodDeclaration' isn't related to 'Iterable<DeclarationImpl>'. - collection_methods_unrelated_type

        info - analyzer/lib/src/summary2/macro_application.dart:1059:20 - The argument type 'TypeDeclaration' isn't related to 'Iterable<DeclarationImpl>'. - collection_methods_unrelated_type

        info - analyzer/lib/src/summary2/macro_application.dart:1074:20 - The argument type 'EnumValueDeclaration' isn't related to 'Iterable<DeclarationImpl>'. - collection_methods_unrelated_type

        info - analyzer/lib/src/summary2/macro_declarations.dart:389:45 - The argument type 'NamedExpression' isn't related to 'Iterable<ExpressionImpl>'. - collection_methods_unrelated_type

        info - test_runner/tool/update_static_error_tests.dart:130:20 - The argument type 'File' isn't related to 'Iterable<FileSystemEntity>'. - collection_methods_unrelated_type

    11 issues found.
    ```
