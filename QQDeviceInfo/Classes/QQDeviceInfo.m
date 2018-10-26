//
//  QQDeviceInfo.m
//  QQDeviceInfo_Example
//
//  Created by 魏国强 on 2018/10/25.
//  Copyright © 2018 魏国强. All rights reserved.
//

#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@import MachO;
#import "QQDeviceInfo.h"
#include <arpa/inet.h>
#include <ifaddrs.h>
#include <net/if.h>
#include <sys/utsname.h>
#include <sys/sysctl.h>


@implementation UIDevice (QQDeviceInfo)
- (NSString *)qq_systemVersion{
    return [QQDeviceInfo currentInfo].systemVersion;
}
- (NSString *)qq_appVersion{
    return [QQDeviceInfo currentInfo].appVersion;
}

- (NSString *)qq_deviceModel
{
    return  [QQDeviceInfo currentInfo].deviceModel;
}
- (NSString *)qq_wifiIPAddress{
    
    return [QQDeviceInfo currentInfo].wifiIPAddress;
}
#pragma mark CPU使用率
- (float)qq_cpuUsage{
    return [QQDeviceInfo currentInfo].cpuUsage;
}

- (float)qq_totalDiskSpace{
    return [QQDeviceInfo currentInfo].totalDiskSpace;
}
- (float)qq_freeDiskSpace{
    return [QQDeviceInfo currentInfo].freeDiskSpace;
}
- (float)qq_usedDiskSpace{
    return [QQDeviceInfo currentInfo].usedDiskSpace;
}
// 系统总内存空间
- (float)qq_totalMemory {
    return [QQDeviceInfo currentInfo].totalMemory;
}

// 活跃的内存,正在使用或者很短时间内被使用过
- (float)qq_activeMemory {
    return [QQDeviceInfo currentInfo].activeMemory;
}

// 最近使用过,但是目前处于不活跃状态的内存
- (float)qq_inActiveMemory {
    return [QQDeviceInfo currentInfo].inActiveMemory;
}

// 空闲的内存空间
- (float)qq_freeMemory {
    return [QQDeviceInfo currentInfo].freeMemory;
}

// 已使用的内存空间
- (float)qq_usedMemory {
    return [QQDeviceInfo currentInfo].usedMemory;
}

// 用来存放内核和数据结构的内存,framework、用户级别的应用无法分配
- (float)qq_wiredMemory {
    return [QQDeviceInfo currentInfo].wiredMemory;
}

// 可释放的内存空间：内存吃紧自动释放，针对大对象存放所需的大块内存空间
- (float)qq_purgableMemory {
    return [QQDeviceInfo currentInfo].purgableMemory;
}




@end


@implementation QQDeviceInfo
- (NSString *)systemVersion{
    return [UIDevice currentDevice].systemVersion;
}
- (NSString *)appVersion{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if (!deviceString) {
        return @"未知设备";
    }
    NSDictionary *deviceDict = @{
 #pragma mark iPhone
                                 @"iPhone3,1":@"iPhone 4",
                                 @"iPhone3,2":@"iPhone 4",
                                 @"iPhone3,3":@"iPhone 4",
                                 @"iPhone4,1":@"iPhone 4S",
                                 @"iPhone5,1":@"iPhone 5",
                                 @"iPhone5,2":@"iPhone 5 (GSM+CDMA)",
                                 @"iPhone5,3":@"iPhone 5c (GSM)",
                                 @"iPhone5,4":@"iPhone 5c (GSM+CDMA)",
                                 @"iPhone6,1":@"iPhone 5s (GSM)",
                                 @"iPhone6,2":@"iPhone 5s (GSM+CDMA)",
                                 @"iPhone7,1":@"iPhone 6 Plus",
                                 @"iPhone7,2":@"iPhone 6",
                                 @"iPhone8,1":@"iPhone 6s",
                                 @"iPhone8,2":@"iPhone 6s Plus",
                                 @"iPhone8,4":@"iPhone SE",
                                 @"iPhone9,1":@"iPhone 7",
                                 @"iPhone9,2":@"iPhone 7 Plus",
                                 @"iPhone9,3":@"iPhone 7",
                                 @"iPhone9,4":@"iPhone 7 Plus",
                                 @"iPhone10,1":@"iPhone 8",
                                 @"iPhone10,4":@"iPhone 8",
                                 @"iPhone10,2":@"iPhone 8 Plus",
                                 @"iPhone10,5":@"iPhone 8 Plus",
                                 @"iPhone10,3":@"iPhone X",
                                 @"iPhone10,6":@"iPhone X",
                                 @"iPhone11,2":@"iPhone XS",
                                 @"iPhone11,4":@"iPhone XS Max",
                                 @"iPhone11,6":@"iPhone XS Max",
                                 @"iPhone11,8":@"iPhone XR",
#pragma mark iPod
                                 @"iPod1,1":@"iPod Touch 1G",
                                 @"iPod2,1":@"iPod Touch 2G",
                                 @"iPod3,1":@"iPod Touch 3G",
                                 @"iPod4,1":@"iPod Touch 4G",
                                 @"iPod5,1":@"iPod Touch (5 Gen)",
#pragma mark iPad
                                 @"iPad1,1":@"iPad",
                                 @"iPad1,2":@"iPad 3G",
                                 @"iPad2,1":@"iPad 2 (WiFi)",
                                 @"iPad2,2":@"iPad 2",
                                 @"iPad2,3":@"iPad 2 (CDMA)",
                                 @"iPad2,4":@"iPad 2",
                                 @"iPad2,5":@"iPad Mini (WiFi)",
                                 @"iPad2,6":@"iPad Mini",
                                 @"iPad2,7":@"iPad Mini (GSM+CDMA)",
                                 @"iPad3,1":@"iPad 3 (WiFi)",
                                 @"iPad3,2":@"iPad 3 (GSM+CDMA)",
                                 @"iPad3,3":@"iPad 3",
                                 @"iPad3,4":@"iPad 4 (WiFi)",
                                 @"iPad3,5":@"iPad 4",
                                 @"iPad3,6":@"iPad 4 (GSM+CDMA)",
                                 @"iPad4,1":@"iPad Air (WiFi)",
                                 @"iPad4,2":@"iPad Air (Cellular)",
                                 @"iPad4,4":@"iPad Mini 2 (WiFi)",
                                 @"iPad4,5":@"iPad Mini 2 (Cellular)",
                                 @"iPad4,6":@"iPad Mini 2",
                                 @"iPad4,7":@"iPad Mini 3",
                                 @"iPad4,8":@"iPad Mini 3",
                                 @"iPad4,9":@"iPad Mini 3",
                                 @"iPad5,1":@"iPad Mini 4 (WiFi)",
                                 @"iPad5,2":@"iPad Mini 4 (LTE)",
                                 @"iPad5,3":@"iPad Air 2",
                                 @"iPad5,4":@"iPad Air 2",
                                 @"iPad6,3":@"iPad Pro 9.7",
                                 @"iPad6,4":@"iPad Pro 9.7",
                                 @"iPad6,7":@"iPad Pro 12.9",
                                 @"iPad6,8":@"iPad Pro 12.9",
                                 @"iPad6,11":@"iPad 5 (WiFi)",
                                 @"iPad6,12":@"iPad 5 (Cellular)",
                                 @"iPad7,1":@"iPad Pro 12.9-inch 2",
                                 @"iPad7,2":@"iPad Pro 12.9-inch 2",
                                 @"iPad7,3":@"iPad Pro 10.5-inch",
                                 @"iPad7,4":@"iPad Pro 10.5-inch",
                                 @"i386":@"Simulator",
                                 @"x86_64":@"Simulator",
                                 };
    return deviceDict[deviceString]?:@"未知设备";
}
- (NSString *)wifiIPAddress{

    {
        NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
        
        // retrieve the current interfaces - returns 0 on success
        struct ifaddrs *interfaces;
        if(!getifaddrs(&interfaces)) {
            // Loop through linked list of interfaces
            struct ifaddrs *interface;
            for(interface=interfaces; interface; interface=interface->ifa_next) {
                if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                    continue; // deeply nested code harder to read
                }
                const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
                char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
                if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                    NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                    NSString *type;
                    if(addr->sin_family == AF_INET) {
                        if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                            type = IP_ADDR_IPv4;
                        }
                    } else {
                        const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                        if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                            type = IP_ADDR_IPv6;
                        }
                    }
                    if(type) {
                        NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                        addresses[key] = [NSString stringWithUTF8String:addrBuf];
                    }
                }
            }
            // Free memory
            freeifaddrs(interfaces);
        }
        return addresses[@"en0/ipv4"]  ?: @"0.0.0.0";
 
    }
}
#pragma mark CPU使用率
- (float)cpuUsage{
    
        float cpu = 0;
        NSArray *cpus = [self getPerCPUUsage];
        if (cpus.count == 0) return -1;
        for (NSNumber *n in cpus) {
            cpu += n.floatValue;
        }
        return cpu;
}
// 获取每个cpu的使用比例
- (NSArray *)getPerCPUUsage {
    processor_info_array_t _cpuInfo, _prevCPUInfo = nil;
    mach_msg_type_number_t _numCPUInfo, _numPrevCPUInfo = 0;
    unsigned _numCPUs;
    NSLock *_cpuUsageLock;
    
    int _mib[2U] = { CTL_HW, HW_NCPU };
    size_t _sizeOfNumCPUs = sizeof(_numCPUs);
    int _status = sysctl(_mib, 2U, &_numCPUs, &_sizeOfNumCPUs, NULL, 0U);
    if (_status)
        _numCPUs = 1;
    
    _cpuUsageLock = [[NSLock alloc] init];
    
    natural_t _numCPUsU = 0U;
    kern_return_t err = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &_numCPUsU, &_cpuInfo, &_numCPUInfo);
    if (err == KERN_SUCCESS) {
        [_cpuUsageLock lock];
        
        NSMutableArray *cpus = [NSMutableArray new];
        for (unsigned i = 0U; i < _numCPUs; ++i) {
            Float32 _inUse, _total;
            if (_prevCPUInfo) {
                _inUse = (
                          (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE])
                          );
                _total = _inUse + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE]);
            } else {
                _inUse = _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE];
                _total = _inUse + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE];
            }
            [cpus addObject:@(_inUse / _total)];
        }
        
        [_cpuUsageLock unlock];
        if (_prevCPUInfo) {
            size_t prevCpuInfoSize = sizeof(integer_t) * _numPrevCPUInfo;
            vm_deallocate(mach_task_self(), (vm_address_t)_prevCPUInfo, prevCpuInfoSize);
        }
        return cpus;
    } else {
        return nil;
    }
}
- (float)totalDiskSpace{
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return -1;
    int64_t space =  [[attrs objectForKey:NSFileSystemSize] longLongValue];
    if (space < 0) space = -1;
    return space/(1024*1024*1024.f);
}
- (float)freeDiskSpace{
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return -1;
    int64_t space =  [[attrs objectForKey:NSFileSystemFreeSize] longLongValue];
    if (space < 0) space = -1;
    return space/(1024*1024*1024.f);
}
- (float)usedDiskSpace{
    int64_t totalDisk = [self totalDiskSpace];
    int64_t freeDisk = [self freeDiskSpace];
    if (totalDisk < 0 || freeDisk < 0) return -1;
    int64_t usedDisk = totalDisk - freeDisk;
    if (usedDisk < 0) usedDisk = -1;
    return usedDisk ;
}
// 系统总内存空间
- (float)totalMemory {
    int64_t totalMemory = [[NSProcessInfo processInfo] physicalMemory];
    if (totalMemory < -1) totalMemory = -1;
    return totalMemory/(1024*1024*1024.f);;
}

// 活跃的内存,正在使用或者很短时间内被使用过
- (float)activeMemory {
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    if (kern != KERN_SUCCESS) return -1;
    return vm_stat.active_count * page_size/(1024*1024*1024.f);;
}

// 最近使用过,但是目前处于不活跃状态的内存
- (float)inActiveMemory {
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    if (kern != KERN_SUCCESS) return -1;
    return vm_stat.inactive_count * page_size/(1024*1024*1024.f);;
}

// 空闲的内存空间
- (float)freeMemory {
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    if (kern != KERN_SUCCESS) return -1;
    return vm_stat.free_count * page_size/(1024*1024*1024.f);;
}

// 已使用的内存空间
- (float)usedMemory {
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    if (kern != KERN_SUCCESS) return -1;
    return page_size * (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count)/(1024*1024*1024.f);;
}

// 用来存放内核和数据结构的内存,framework、用户级别的应用无法分配
- (float)wiredMemory {
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    if (kern != KERN_SUCCESS) return -1;
    return vm_stat.wire_count * page_size/(1024*1024*1024.f);;
}

// 可释放的内存空间：内存吃紧自动释放，针对大对象存放所需的大块内存空间
- (float)purgableMemory {
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    if (kern != KERN_SUCCESS) return -1;
    return vm_stat.purgeable_count * page_size/(1024*1024*1024.f);;
}

+ (instancetype)currentInfo{
    static QQDeviceInfo *info ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!info) {
            info = [[QQDeviceInfo alloc]init];
        }
    });
    return info;
}
@end
