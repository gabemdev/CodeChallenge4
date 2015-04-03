//
//  Parser.h
//  Assessment4
//
//  Created by Rockstar. on 4/3/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject

@property NSManagedObjectContext *moc;

- (instancetype)initWithObjectContext:(NSManagedObjectContext *)context;
- (NSArray *)getDogArrayFromData;

@end
