import 'dart:ffi' as ffi;
import 'package:path/path.dart' as p;

typedef PrintHello = void Function();
typedef PrintHello_func = ffi.Void Function();
ffi.DynamicLibrary dylib = ffi.DynamicLibrary.open(p.absolute("lib", "src", "hello_world.dll"));
final PrintHello hello = dylib.lookup<ffi.NativeFunction<PrintHello_func>>('PrintHello').asFunction();