#import "OnemodulePlugin.h"
#if __has_include(<onemodule/onemodule-Swift.h>)
#import <onemodule/onemodule-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "onemodule-Swift.h"
#endif

@implementation OnemodulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOnemodulePlugin registerWithRegistrar:registrar];
}
@end
