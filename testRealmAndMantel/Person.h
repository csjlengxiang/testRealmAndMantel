//
//  Person.h
//  testRealmAndMantel
//
//  Created by csj on 16/5/14.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <Realm/Realm.h>
#import <Mantle.h>

@interface Person : RLMObject

@property NSString * name;
@property NSNumber<RLMInt> * age;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person>
RLM_ARRAY_TYPE(Person)

@interface SPObject : MTLModel

@property (nonatomic, copy) NSString * id;
@property (nonatomic, strong) Class modelClass;
- (NSArray<NSString *> *)getPropertyKeys;

@end

@interface PersonObject : SPObject <MTLJSONSerializing>

@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) int age;

@end
