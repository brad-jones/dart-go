import 'dart:io';
import 'dart:ffi' as ffi;
import 'package:path/path.dart' as p;

ffi.DynamicLibrary dylib = ffi.DynamicLibrary.open(p.absolute('lib', 'src', Platform.operatingSystem + '-amd64.dll'));

typedef PrintHello = void Function();
typedef PrintHello_func = ffi.Void Function();
final PrintHello hello = dylib.lookup<ffi.NativeFunction<PrintHello_func>>('PrintHello').asFunction();

typedef Exec = void Function();
typedef Exec_func = ffi.Void Function();
final Exec exec = dylib.lookup<ffi.NativeFunction<Exec_func>>('PrintHelExeclo').asFunction();