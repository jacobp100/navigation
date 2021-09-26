#import "NVBottomSheetView.h"

#import <React/UIView+React.h>

@implementation NVBottomSheetView {
    UIViewController *_bottomSheetController;
}

- (id)init
{
    if (self = [super init]) {
        _bottomSheetController = [UIViewController new];
    }
    return self;
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
    _bottomSheetController.view = subview;
}

@end
