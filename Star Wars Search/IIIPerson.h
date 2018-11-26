//
//  IIIPerson.h
//  Star Wars Search
//
//  Created by Ilgar Ilyasov on 11/26/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIPerson : NSObject

- (instancetype)initWithName:(NSString *)name
                   birthYear:(NSString *)birthYear
                      height:(double)height
                    eyeColor:(NSString *)eyeColor;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *birthYear;
@property (nonatomic, readonly) double height;
@property (nonatomic, copy, readonly) NSString *eyeColor;

@end

NS_ASSUME_NONNULL_END
