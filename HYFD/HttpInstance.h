//
//  HttpInstance.h
//  HYFD
//
//  Created by SongYanming on 16/2/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuotaOrderModel.h"
#define SERVERURL @"http://www.sdhyfd.com/rcmp/jf/api/"

@interface HttpInstance : NSObject
+(HttpInstance *)getInstance;
-(void)quotaOrder:(QuotaOrderModel*)model;

@end
