#import "NVBarTitleViewManager.h"
#import "NVBarTitleView.h"

@implementation NVBarTitleViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    return [[NVBarTitleView alloc] init];
}

@end
