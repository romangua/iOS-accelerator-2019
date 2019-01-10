//
//  MAOListViewControllerModel.m
//  MyAppOne
//
//  Created by Julio Castillo on 10/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOListViewControllerModel.h"

@implementation MAOListViewControllerModel

- (id)initFromDictionary:(NSDictionary * )item {
    if(!(self = [super init])) {
        return nil;
    }
    
    _artistName = [item valueForKey:@"artistName"];
    _collectionName = [item valueForKey:@"collectionName"];
    _trackName = [item valueForKey:@"trackName"];
    _artistViewUrl = [item valueForKey:@"artistViewUrl"];
    _collectionViewUrl = [item valueForKey:@"collectionViewUrl"];
    _trackViewUrl = [item valueForKey:@"trackViewUrl"];
    _collectionPrice = [item valueForKey:@"collectionPrice"];
    _trackPrice = [item valueForKey:@"trackPrice"];
    
    return self;
}

@end
