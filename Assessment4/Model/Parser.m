//
//  Parser.m
//  Assessment4
//
//  Created by Rockstar. on 4/3/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "Parser.h"
#import "Person.h"

@implementation Parser

- (instancetype)initWithObjectContext:(NSManagedObjectContext *)context {
    if (self = [super init]) {
        self.moc = context;
    }
    return self;
}

- (NSArray *)getDogArrayFromData {
    NSString *urlString = @"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/25/owners.json";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSArray *dogArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    NSMutableArray *results = [NSMutableArray new];
    for (NSString *owner in dogArray) {
        Person *newPerson = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Person class]) inManagedObjectContext:self.moc];
        newPerson.name = owner;
        [results addObject:newPerson];
    }

    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [self.moc save:nil];

    return [results sortedArrayUsingDescriptors:@[sortDescriptor]];

}

@end
