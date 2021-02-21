//
//  EXViewController.m
//  ExNetwork
//
//  Created by a289458845 on 02/21/2021.
//  Copyright (c) 2021 a289458845. All rights reserved.
//

#import "EXViewController.h"
#import <ExNetwork/ExNetwork.h>
@interface EXViewController ()

@end

@implementation EXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ExNetwork initNetwork:@"http://120.221.95.146:10001"];
    [ExNetwork manager].token = @"8761051B4D8D47A5A02213330F13BC54";
    
    [self test];
}

-(void)test{
    NSDictionary *params = @{
        @"App_Key":@"ty_ztc"
    };
    
    [[ExNetwork sharedManager] PostUrlString:@"/api/AppReports/GetRegion" parameters:params success:^(id  _Nullable responseObject) {
        if ([responseObject[@"Code"] integerValue] == 0) {
            //
            //            NSArray *regionListArray  = responseObject[@"Data"];
            //            NSMutableArray *temp = [NSMutableArray array];
            //            for (NSDictionary *dict in regionListArray) {
            //                ExRegionModel *model = [ExRegionModel mj_objectWithKeyValues:dict];
            //                [temp addObject:model];
            //            }
            //            //归档
            //            NSString *path = [kDocumentPath stringByAppendingPathComponent:@"Region.data"];
            //            [NSKeyedArchiver archiveRootObject:temp toFile:path];
            NSLog(@"response = %@",responseObject);
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
@end
