//
//  IIIPerson.m
//  Star Wars Search
//
//  Created by Ilgar Ilyasov on 11/26/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIIPerson.h"

@implementation IIIPerson

- (instancetype)initWithName:(NSString *)name
                   birthYear:(NSString *)birthYear
                      height:(double)height
                    eyeColor:(NSString *)eyeColor
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _birthYear = [birthYear copy];
        _height = height;
        _eyeColor = [eyeColor copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *birthYear = dictionary[@"birth_year"];
    NSString *heightString = dictionary[@"height"];
    double height = [heightString doubleValue];
    NSString *eyeColor = dictionary[@"eye_color"];
    if (!name || !birthYear || !heightString || !eyeColor) {
        return nil;
    }
    
    return [self initWithName:name birthYear:birthYear height:height eyeColor:eyeColor];
}

@end
