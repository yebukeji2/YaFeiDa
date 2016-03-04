//
//  QueryModel.h
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueryModel : NSObject
@property(nonatomic,strong)NSString *date;
@property(nonatomic,strong)NSString *tel;
@property(nonatomic,strong)NSString *operation;
@property(nonatomic,assign)BOOL state;


@end
