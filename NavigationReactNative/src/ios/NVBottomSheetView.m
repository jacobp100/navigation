#import "NVBottomSheetView.h"
#import "NVSearchResultsController.h"

#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>
#import <React/UIView+React.h>

#import <React/RCTLayoutAnimationGroup.h>
#import <React/RCTLayoutAnimation.h>

@interface RCTTransitionLayoutAnimation : RCTLayoutAnimation
- (instancetype)initWithTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)transitionCoordinator;
@end

@implementation RCTTransitionLayoutAnimation {
    __weak id<UIViewControllerTransitionCoordinator> _transitionCoordinator;
}

RCT_NOT_IMPLEMENTED(- (instancetype)initWithDuration:(NSTimeInterval)duration config:(NSDictionary *)config)
RCT_NOT_IMPLEMENTED(- (instancetype)initWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay property:(NSString *)property springDamping:(CGFloat)springDamping initialVelocity:(CGFloat)initialVelocity animationType:(RCTAnimationType)animationType)
- (instancetype)initWithTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)transitionCoordinator
{
    if (self = [super init]) {
        _transitionCoordinator = transitionCoordinator;
    }
    return self;
}

- (void)performAnimations:(void (^)(void))animations withCompletionBlock:(void (^)(BOOL))completionBlock
{
    if (_transitionCoordinator) {
        NSLog(@"Using transition coordinator");
        [_transitionCoordinator
         animateAlongsideTransition:^(id context) { animations(); }
         completion:^(id context) { completionBlock(YES); }];
    } else {
        NSLog(@"No transition coordinator");
        animations();
        completionBlock(YES);
    }
}

- (BOOL)isEqual:(id)object
{
    return self == object;
}

+ (NSString *)description
{
    return @"Transition Coordinator";
}

@end

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
        _bottomSheetController.sizeDidChangeBlock = ^(CGSize newSize, id<UIViewControllerTransitionCoordinator> coordinator) {
            [weakSelf notifyForSizeChange:newSize
                              coordinator:coordinator];
        };
    }
    return self;
}

- (void)notifyForSizeChange:(CGSize)newSize
                coordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    if (coordinator) {
        NSLog(@"WILL TRANSITION");
    }
    [_bridge.uiManager setSize:newSize forView:_reactSubview];

}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    if (@available(iOS 15.0, *)) {
        UISheetPresentationController *sheet =_bottomSheetController.sheetPresentationController;
        sheet.detents = [NSArray arrayWithObjects:[UISheetPresentationControllerDetent mediumDetent], [UISheetPresentationControllerDetent largeDetent], nil];
//        sheet.delegate = self;
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

//- (void)presentationController:(UIPresentationController *)presentationController
//  willPresentWithAdaptiveStyle:(UIModalPresentationStyle)style
//         transitionCoordinator:(id<UIViewControllerTransitionCoordinator>)transitionCoordinator
//{
//    NSLog(@"WILL PRESENT");
//    RCTTransitionLayoutAnimation *animation =
//        [[RCTTransitionLayoutAnimation alloc]
//         initWithTransitionCoordinator:transitionCoordinator];
//    RCTLayoutAnimationGroup *animationGroup =
//        [[RCTLayoutAnimationGroup alloc]
//         initWithCreatingLayoutAnimation:animation
//         updatingLayoutAnimation:animation
//         deletingLayoutAnimation:animation
//         callback:^(id response) {
//            NSLog(@"DONE");
//        }];
//    [_bridge.uiManager setNextLayoutAnimationGroup:animationGroup];
//}

@end
