#import "NVBottomSheetView.h"
#import "NVSearchResultsController.h"

#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>
#import <React/UIView+React.h>

@implementation NVBottomSheetView {
    NVSearchResultsController *_bottomSheetController;
    __weak RCTBridge *_bridge;
    UIView *_reactSubview;
}

- (id)initWithBridge:(RCTBridge *)bridge
{
    if (self = [super init]) {
        _bridge = bridge;
        _bottomSheetController = [[NVSearchResultsController alloc] init];
        UIView *containerView = [UIView new];
        containerView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _bottomSheetController.view = containerView;
        __weak typeof(self) weakSelf = self;
        _bottomSheetController.boundsDidChangeBlock = ^(CGRect newBounds) {
            [weakSelf notifyForBoundsChange:newBounds];
        };
    }
    return self;
}

- (void)notifyForBoundsChange:(CGRect)newBounds
{
    [_bridge.uiManager setSize:newBounds.size forView:_reactSubview];

}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    if (@available(iOS 15.0, *)) {
        UISheetPresentationController *sheet =_bottomSheetController.sheetPresentationController;
        sheet.detents = [NSArray arrayWithObjects:[UISheetPresentationControllerDetent mediumDetent], [UISheetPresentationControllerDetent largeDetent], nil];
    }
    [self.reactViewController presentViewController:_bottomSheetController animated:true completion:^{}];
}

- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
{
    [super insertReactSubview:subview atIndex:atIndex];
    [_bottomSheetController.view insertSubview:subview atIndex:0];
    _reactSubview = subview;
}

- (void)didUpdateReactSubviews
{
}

@end
