//
//  NSArray+CNJacobEmptyException.m
//  Common4Jacob
//
//  Created by jacob on 2018/11/13.
//  Copyright © 2018 CNJacob. All rights reserved.
//

#import "NSArray+CNJacobEmptyException.h"
#import <objc/runtime.h>

@implementation NSArray (CNJacobEmptyException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            /** 创建数组 */
            [objc_getClass("__NSPlaceholderArray") exchangeMethod:@selector(initWithObjects:count:) newMethod:@selector(jacob_initWithObjects:count:)];
            
            /** 取数据 */
            [objc_getClass("__NSArray0") exchangeMethod:@selector(objectAtIndex:) newMethod:@selector(jacob_emptyObjectAtIndex:)];
            [objc_getClass("__NSArrayI") exchangeMethod:@selector(objectAtIndex:) newMethod:@selector(jacob_objectAtIndex:)];
            [objc_getClass("__NSSingleObjectArrayI") exchangeMethod:@selector(objectAtIndex:) newMethod:@selector(jacob_singleObjectAtIndex:)];
        }
    });
}

- (id)jacob_initWithObjects:(const id [])objects count:(NSUInteger)count {
    for (int i = 0; i < count; i ++) {
        if (objects == NULL) {
            NSLog(@"objects 为 NULL, 返回 nil %s",__FUNCTION__);
            return nil;
        }
        if (objects[i] == nil) {
            NSLog(@"取值时: 取出的元素为 nil, 返回 nil %s",__FUNCTION__);
            return nil;
        }
    }
    return [self jacob_initWithObjects:objects count:count];
}

- (id)jacob_emptyObjectAtIndex:(NSUInteger)index {
    return nil;
}

- (id)jacob_objectAtIndex:(NSInteger)index {
    if (index >= self.count || index < 0) {
        NSLog(@"取值时: 索引越界,返回 nil %s",__FUNCTION__);
        return nil;
    }
    
    id obj = [self jacob_objectAtIndex:index];
    if ([obj isKindOfClass:[NSNull class]]) {
        NSLog(@"取值时: 取出的元素类型为 NSNull 类型,返回 nil %s",__FUNCTION__);
        return nil;
    }
    
    return obj;
}

- (id)jacob_singleObjectAtIndex:(NSInteger)index {
    if (index >= self.count || index < 0) {
        NSLog(@"数组中只有一个元素, 取值时: 索引越界, 返回 nil %s",__FUNCTION__);
        return nil;
    }
    
    id obj = [self jacob_singleObjectAtIndex:index];
    if ([obj isKindOfClass:[NSNull class]]) {
        NSLog(@"数组中只有一个元素, 取值时: 元素类型为 NSNull 类型, 返回 nil %s",__FUNCTION__);
        return nil;
    }
    
    return obj;
}

@end


@implementation NSMutableArray (CNJacobEmptyException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            /** 取数据 */
            [objc_getClass("__NSArrayM") exchangeMethod:@selector(objectAtIndex:) newMethod:@selector(jacob_mutableObjectAtIndex:)];
            
            /** 数组末尾添加数据 */
            [objc_getClass("__NSArrayM") exchangeMethod:@selector(addObject:) newMethod:@selector(jacob_addObject:)];
            [objc_getClass("__NSSingleObjectArrayI") exchangeMethod:@selector(addObject:) newMethod:@selector(jacob_singleAddObject:)];
            
            /** 数组指定位置添加数据 */
            [objc_getClass("__NSArrayM") exchangeMethod:@selector(insertObject:atIndex:) newMethod:@selector(jacob_insertObject:atIndex:)];
            [objc_getClass("__NSSingleObjectArrayI") exchangeMethod:@selector(insertObject:atIndex:) newMethod:@selector(jacob_singleInsertObject:atIndex:)];
            
            /** 移除数组中的某个数据 */
            [objc_getClass("__NSArrayM") exchangeMethod:@selector(removeObject:) newMethod:@selector(jacob_removeObject:)];
            [objc_getClass("__NSSingleObjectArrayI") exchangeMethod:@selector(removeObject:) newMethod:@selector(jacob_singleRemoveObject:)];
            
            /** 移除数组中的指定位置数据 */
            [objc_getClass("__NSArrayM") exchangeMethod:@selector(removeObjectAtIndex:) newMethod:@selector(jacob_removeObjectAtIndex:)];
            [objc_getClass("__NSSingleObjectArrayI") exchangeMethod:@selector(removeObjectAtIndex:) newMethod:@selector(jacob_singleRemoveObjectAtIndex:)];
        }
    });
}

- (id)jacob_mutableObjectAtIndex:(NSInteger)index {
    if (index >= self.count || index < 0) {
        NSLog(@"取值时: 索引越界, 返回 nil %s",__FUNCTION__);
        return nil;
    }
    id obj = [self jacob_mutableObjectAtIndex:index];
    if ([obj isKindOfClass:[NSNull class]]) {
        NSLog(@"取值时: 取出的元素类型为 NSNull, 返回 nil %s",__FUNCTION__);
        return nil;
    }
    return obj;
}

- (void)jacob_addObject:(id)object {
    if (object) {
        [self jacob_addObject:object];
        return ;
    }
    
    NSLog(@"插入值时: 元素类型为 nil, %s",__FUNCTION__);
    [self jacob_addObject:[NSNull null]];
}

- (void)jacob_singleAddObject:(id)object {
    if (object) {
        [self jacob_singleAddObject:object];
        return ;
    }
    
    Class superClass = self.superclass;
    NSString *superClassStr = NSStringFromClass(superClass);
    if (![superClassStr isEqualToString:@"NSMutableArray"]) {
        NSLog(@"数组中只有一个元素, 并且数组真实类型为NSMutableArray 插入值: 元素类型为 nil, %s",__FUNCTION__);
        [self jacob_singleAddObject:[NSNull null]];
    } else {
        NSLog(@"真实类型是NSArray,什么都不做 %s",__FUNCTION__);
    }
}

- (void)jacob_insertObject:(id)object atIndex:(NSUInteger)index {
    if (object) {
        [self jacob_insertObject:object atIndex:index];
        return ;
    }
    
    NSLog(@"插入值时: 元素类型为 nil, %s",__FUNCTION__);
    [self jacob_insertObject:[NSNull null] atIndex:index];
}

- (void)jacob_singleInsertObject:(id)object atIndex:(NSUInteger)index {
    if (object) {
        [self jacob_singleInsertObject:object atIndex:index];
        return ;
    }
    
    Class superClass = self.superclass;
    NSString *superClassStr = NSStringFromClass(superClass);
    if (![superClassStr isEqualToString:@"NSMutableArray"]) {
        NSLog(@"数组中只有一个元素, 并且数组真实类型为NSMutableArray 插入值: 元素类型为 nil, %s",__FUNCTION__);
        [self jacob_singleInsertObject:[NSNull null] atIndex:index];
    } else {
        NSLog(@"真实类型是NSArray,什么都不做 %s",__FUNCTION__);
    }
}

- (void)jacob_removeObject:(id)object {
    if (!object) {
        NSLog(@"删除值时: 元素类型为 nil, %s",__FUNCTION__);
        return ;
    }
    
    [self jacob_removeObject:object];
}

- (void)jacob_singleRemoveObject:(id)object {
    if (!object) {
        NSLog(@"删除值时: 元素类型为 nil, %s",__FUNCTION__);
        return ;
    }
    
    [self jacob_singleRemoveObject:object];
}

- (void)jacob_removeObjectAtIndex:(NSInteger)index {
    if (index >= self.count || index < 0) {
        NSLog(@"取值时: 索引越界, %s",__FUNCTION__);
        return ;
    }
    
    [self jacob_removeObjectAtIndex:index];
}

- (void)jacob_singleRemoveObjectAtIndex:(NSInteger)index {
    if (index >= self.count || index < 0) {
        NSLog(@"取值时: 索引越界, %s",__FUNCTION__);
        return ;
    }
    
    [self jacob_singleRemoveObjectAtIndex:index];
}

@end
