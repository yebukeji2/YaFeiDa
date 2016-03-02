//
//  RechangeViewController.m
//  HYFD
//
//  Created by SongYanming on 16/2/16.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "RechangeViewController.h"
#import "RechargeCollectionViewCell.h"
#import "HttpInstance.h"
#import "QuotaOrderModel.h"
#import "VlorNetWorkAPI.h"
#import "INBMacroAdditions.h"
#import "INBSecurityCrypto.h"
#import "NSData+INB.h"
#import "NSString+INB.h"
#import "INBAES.h"
#import "INBTripleDES.h"
#import "SVProgressHUD.h"

@interface RechangeViewController ()
@property(nonatomic,strong)NSArray *numArr;
@property (nonatomic, copy) NSData *plainData;

@end

@implementation RechangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.Flag == 0){
        self.navigationItem.titleView = self.seg;
    }else{
        self.navigationItem.titleView = self.SecSeg;

    }
    self.numArr = [NSArray arrayWithObjects:@"10",@"20",@"30",@"50",@"100",@"200",@"300",@"500", nil];
    [self.collectionView registerNib:[UINib nibWithNibName:@"RechargeCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:@"RechargeCollectionViewCell"];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)segAction:(id)sender {
    UISegmentedControl *seg = sender;
    if(seg.selectedSegmentIndex == 0){
        
    }else{
        
    }
}
- (IBAction)SecSegAction:(id)sender {
    UISegmentedControl *seg = sender;
    if(seg.selectedSegmentIndex == 0){
        
    }else{
        
    }
}
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    QuotaOrderModel *model = [[QuotaOrderModel alloc]init];
    model.terminalName = @"jnrt01";
    model.customerOrderId = @"20151216165649031185230583635634";
    model.phoneNo = self.phoneNoTF.text;
    model.orderType = @"1";
    model.spec = @"10";
    model.scope = @"province";
    model.callbackUrl= @"http://125.85.59.164:7890/";
    model.timeStamp= @"20151216165648843";
    NSString *paramStr = [NSString stringWithFormat:@"%@@%@@%@@%@@%@@%@@%@@%@",model.terminalName,model.customerOrderId,model.phoneNo,model.orderType,model.spec,model.scope,model.callbackUrl,model.timeStamp];
    
    NSString *md5Str = [paramStr md5 ];
    //    NSError *error;
    //    NSData *data = [RSATool encrypt:md5Str error:&error];
    //    model.signature = [data base64EncodedStringWithOptions:0];
    
    //    model.signature = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    ;
    
    self.plainData = [md5Str dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger length = md5Str.length;
    NSLog(@"plainText length - %lu", (unsigned long)md5Str.length);
    NSLog(@"plainData length - %lu", (unsigned long)length);
    INBRSA *rsa = [INBRSA sharedINBRSA];
    // 自iOS 5.0起，不再支持kSecPaddingPKCS1MD2、kSecPaddingPKCS1MD5
    NSArray *paddings = @[
                          //						  @(kSecPaddingPKCS1MD2),/* Unsupported as of iOS 5.0 */
                          //						  @(kSecPaddingPKCS1MD5),/* Unsupported as of iOS 5.0 */
                          @(kSecPaddingPKCS1SHA1),
                          @(kSecPaddingPKCS1SHA224),
                          @(kSecPaddingPKCS1SHA256),
                          @(kSecPaddingPKCS1SHA384),
                          @(kSecPaddingPKCS1SHA512),
                          ];
    NSUInteger idx = arc4random() % paddings.count;
    NSNumber *padding = paddings[idx];
    rsa.padding = padding.unsignedIntValue;
    NSLog(@"padding - %x", rsa.padding);
    NSLog(@"rsa private key - %@", rsa.privateKey);
    NSLog(@"rsa public  key - %@", rsa.publicKey);
    NSData *sigData = [rsa signDataWithPrivateKey:self.plainData];
    model.signature = [sigData base64EncodedStringWithOptions:0];
    BOOL success = [rsa verifyDataWithPublicKey:self.plainData digitalSignature:sigData];
    NSLog(@"isSuccess = %d",success);
    [[HttpInstance getInstance]quotaOrder:model];
    
}

#pragma mark - Collection View Data Source
//每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    
    return self.numArr.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RechargeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RechargeCollectionViewCell" forIndexPath:indexPath];
    cell.numLabel.text = [self.numArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    RechargeCollectionViewCell *cell = (RechargeCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.numLabel.backgroundColor = [UIColor redColor];
    int num =[[self.numArr objectAtIndex:indexPath.row]intValue];
    int cutPrice = num*0.9;
    self.cutPriceTF.text = [NSString stringWithFormat:@"%d",cutPrice];
    self.actualPriceLabel.text = [self.numArr objectAtIndex:indexPath.row];
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    RechargeCollectionViewCell *cell = (RechargeCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.numLabel.backgroundColor = [UIColor lightGrayColor];
    
}

//每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 10);
}
//cell的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if([textField isEqual:self.phoneNoTF])
    {
        
        
        BOOL isTel = [self checkTel:self.phoneNoTF.text];
        if(!isTel)
        {
            
        }
        
    }
    
}

#pragma -mark 正则表达式验证方法
- (BOOL)checkTel:(NSString *)str
{
    // NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSString *regex = @"^[1][3-9]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch)
    {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号码"];
        return NO;
        
    }
    return YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)RechangeBtnaction:(id)sender {
    [self setUp];

}
@end
