#import <React/RCTBridge.h>
#import <UIKit/UIKit.h>

@interface NVBottomSheetView : UIView <UISheetPresentationControllerDelegate>

-(id)initWithBridge: (RCTBridge *)bridge;

@end
