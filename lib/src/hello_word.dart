import 'dart:io';
import 'dart:isolate';
import 'dart:ffi' as ffi;
import 'package:path/path.dart' as p;

ffi.DynamicLibrary _lib;
Future<ffi.DynamicLibrary> _getLib() async {
  if (_lib == null) {
    var uri = Uri.parse('package:dart_go/src/${Platform.operatingSystem}-amd64.dll');
    var path = (await Isolate.resolvePackageUri(uri)).path;
    _lib = ffi.DynamicLibrary.open(p.normalize(path).replaceFirst('\\', ''));
  }
  return _lib;
}

typedef PrintHello = void Function();
typedef PrintHello_func = ffi.Void Function();
void printHello() async {
  final PrintHello f = (await _getLib()).lookup<ffi.NativeFunction<PrintHello_func>>('PrintHello').asFunction();
  f();
}