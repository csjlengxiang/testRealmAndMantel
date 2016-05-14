//
//  Person.m
//  testRealmAndMantel
//
//  Created by csj on 16/5/14.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end

@implementation PersonObject

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"name": @"name",
             @"age": @"age"};
}

@end


@implementation SPObject

- (NSArray<NSString *> *)getPropertyKeys {
    NSMutableArray<NSString *> * result = [NSMutableArray<NSString *> array];
    unsigned int propertiesCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertiesCount);
    for(unsigned int i = 0; i < propertiesCount; i++) {
        objc_property_t property = properties[i];
        NSString * key = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [result addObject:key];
    }
    free(properties);
    [result addObject:@"id"];
    return [result copy];
}

@end
