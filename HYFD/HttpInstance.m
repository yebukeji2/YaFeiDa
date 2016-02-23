//
//  HttpInstance.m
//  HYFD
//
//  Created by SongYanming on 16/2/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "HttpInstance.h"
#import "AFHTTPRequestOperationManager.h"
static HttpInstance *httpInstance = nil;

@implementation HttpInstance
+(HttpInstance *)getInstance{
    if (httpInstance == nil) {
        httpInstance = [[HttpInstance alloc] init];
    }
    return httpInstance;
}
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)quotaOrder:(QuotaOrderModel*)model{
    NSString *urlString = [NSString stringWithFormat:@"%@quotaOrder",SERVERURL];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 15;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *parameters = @{@"terminalName": model.terminalName,@"customerOrderId": model.customerOrderId,@"phoneNo":model.phoneNo,@"orderType":model.orderType,@"spec": model.spec,@"scope": model.scope,@"callbackUrl": model.callbackUrl,@"timeStamp": model.timeStamp,@"signature": model.signature};
    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"result----quotaOrder = %@",result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error----quotaOrder = %@",error);
    }];

    
}


@end
