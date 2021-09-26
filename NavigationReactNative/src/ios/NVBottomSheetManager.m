#import "NVBottomSheetManager.h"
#import "NVBottomSheetView.h"

@implementation NVBottomSheetManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[NVBottomSheetView alloc] init];
}

@end
