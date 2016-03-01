//
//  UIView+CornerRadius.h
//  HYFD
//
//  Created by SongYanming on 16/2/25.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface UIView (CornerRadius)
@property(nonatomic,assign)IBInspectable CGFloat cornerRadius;
@property(nonatomic,assign)IBInspectable CGFloat borderWidth;
@property(nonatomic,strong)IBInspectable UIColor* borderColor;




@end
