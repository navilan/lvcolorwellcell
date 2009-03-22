//
//  Colors.h
//  LVColorWellCell
//
//  Created by Lakshmi Vyasarajan on 3/21/09.
//  Copyright 2009 Extrazeal. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Colors : NSObject {
	@private
	NSString * area;
	NSColor * color;
}

@property (copy) NSString * area;
@property (retain) NSColor * color;

@end
