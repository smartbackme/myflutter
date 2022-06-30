#import "TwomodulePlugin.h"
#if __has_include(<twomodule/twomodule-Swift.h>)
#import <twomodule/twomodule-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "twomodule-Swift.h"
#endif

@implementation TwomodulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTwomodulePlugin registerWithRegistrar:registrar];
}
@end
