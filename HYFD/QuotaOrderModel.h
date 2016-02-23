//
//  QuotaOrderModel.h
//  HYFD
//
//  Created by SongYanming on 16/2/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuotaOrderModel : NSObject
@property(nonatomic,strong)NSString *terminalName;//终端接口商户的登陆名
@property(nonatomic,strong)NSString *customerOrderId;//客户32位订单号
@property(nonatomic,strong)NSString *phoneNo;//客户手机号码
@property(nonatomic,strong)NSString *orderType;//业务操作类型(固定参数值：2)
@property(nonatomic,strong)NSString *spec;//充值规格(整数，以分为单位，如充值30元，参数组织：spec=3000)
@property(nonatomic,strong)NSString *scope;//使用范围(固定参数填写：nation)
@property(nonatomic,strong)NSString *callbackUrl;//充值结果回调接口地址
@property(nonatomic,strong)NSString *timeStamp;//时间戳，格式：yyyyMMddHHmmssSSS
@property(nonatomic,strong)NSString *signature;//数据私钥签名

@end
