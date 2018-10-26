//
//  QQViewController.m
//  QQDeviceInfo
//
//  Created by 魏国强 on 10/25/2018.
//  Copyright (c) 2018 魏国强. All rights reserved.
//

#import "QQViewController.h"
#import <QQDeviceInfo/QQDeviceInfo.h>
 
@interface QQViewController ()

@end

@implementation QQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   QQDeviceInfo *device = [[QQDeviceInfo alloc]init];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"设备型号：%@",[device deviceModel]);
    });
    
    NSLog(@"wifi IP地址：%@",device.wifiIPAddress);
    NSLog(@"cpu使用率:%f",device.cpuUsage );
    NSLog(@"总容量：%.2fGB",device.totalDiskSpace);
    NSLog(@"已用容量：%.2fGB",device.usedDiskSpace);
    NSLog(@"未用容量：%.2fGB",device.freeDiskSpace);
    NSLog(@"内存总量：%.2fGB",device.totalMemory);
    NSLog(@"内存未用容量：%f",device.freeMemory);
    NSLog(@"内存已用容量：%.2fGB",device.usedMemory);
    NSLog(@"内存最近使用过容量：%.2fGB",device.inActiveMemory);
    NSLog(@"内存正在使用容量：%.2fGB",device.activeMemory);
    NSLog(@"内存可释放容量：%.2fGB",device.purgableMemory);
    NSLog(@"内存内核数据结构容量：%.2fGB",device.wiredMemory);
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
