#import "CommonmodulePlugin.h"
#if __has_include(<commonmodule/commonmodule-Swift.h>)
#import <commonmodule/commonmodule-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "commonmodule-Swift.h"
#endif

@implementation CommonmodulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCommonmodulePlugin registerWithRegistrar:registrar];
}
@end
