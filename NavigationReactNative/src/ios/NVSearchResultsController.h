#import <UIKit/UIKit.h>

@interface NVSearchResultsController : UIViewController

@property (nonatomic, copy) void (^sizeDidChangeBlock)(CGSize newSize, id<UIViewControllerTransitionCoordinator> coordinator);

@end
