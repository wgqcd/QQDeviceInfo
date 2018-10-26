//
//  QQDeviceInfo.h
//  QQDeviceInfo_Example
//
//  Created by 魏国强 on 2018/10/25.
//  Copyright © 2018 魏国强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (QQDeviceInfo)
@property(nonatomic,readonly)NSString            *qq_systemVersion;///<设备系统版本
@property(nonatomic,readonly)NSString            *qq_appVersion;///<应用版本
@property(nonatomic,readonly)NSString            *qq_deviceModel; ///<设备型号
@property(nonatomic,readonly)NSString            *qq_wifiIPAddress;///<ip地址
@property(nonatomic,readonly)float            qq_cpuUsage;///<cpu使用率
@property(nonatomic,readonly)float            qq_totalDiskSpace;///<磁盘总容量 GB
@property(nonatomic,readonly)float            qq_usedDiskSpace;///<已用磁盘容量 GB
@property(nonatomic,readonly)float            qq_freeDiskSpace;///<未使用磁盘容量 GB
@property(nonatomic,readonly)float            qq_totalMemory;///<内存总量
@property(nonatomic,readonly)float            qq_activeMemory;///<正在使用的内存容量
@property(nonatomic,readonly)float            qq_inActiveMemory;///<最近使用过的内存容量
@property(nonatomic,readonly)float            qq_freeMemory;///<空闲内存容量
@property(nonatomic,readonly)float            qq_usedMemory;///<已使用内存容量
@property(nonatomic,readonly)float            qq_wiredMemory;///<内核数据结构内存容量
@property(nonatomic,readonly)float            qq_purgableMemory;///<可释放的内存容量
@end

@interface QQDeviceInfo : NSObject
@property(nonatomic,readonly)NSString            *systemVersion;///<设备系统版本
@property(nonatomic,readonly)NSString            *appVersion;///<应用版本
@property(nonatomic,readonly)NSString            *deviceModel; ///<设备型号
@property(nonatomic,readonly)NSString            *wifiIPAddress;///<ip地址
@property(nonatomic,readonly)float            cpuUsage;///<cpu使用率
@property(nonatomic,readonly)float            totalDiskSpace;///<磁盘总容量 GB
@property(nonatomic,readonly)float            usedDiskSpace;///<已用磁盘容量 GB
@property(nonatomic,readonly)float            freeDiskSpace;///<未使用磁盘容量 GB
@property(nonatomic,readonly)float            totalMemory;///<内存总量
@property(nonatomic,readonly)float            activeMemory;///<正在使用的内存容量
@property(nonatomic,readonly)float            inActiveMemory;///<最近使用过的内存容量
@property(nonatomic,readonly)float            freeMemory;///<空闲内存容量
@property(nonatomic,readonly)float            usedMemory;///<已使用内存容量
@property(nonatomic,readonly)float            wiredMemory;///<内核数据结构内存容量
@property(nonatomic,readonly)float            purgableMemory;///<可释放的内存容量
+ (instancetype)currentInfo;
@end

NS_ASSUME_NONNULL_END
