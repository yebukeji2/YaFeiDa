//
//  UIView+CornerRadius.m
//  HYFD
//
//  Created by SongYanming on 16/2/25.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "UIView+CornerRadius.h"
IBInspectable
@implementation UIView (CornerRadius)
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}




@end
