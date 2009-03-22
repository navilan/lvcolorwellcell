//
//  ColorsController.h
//  LVColorWellCell
//
//  Created by Lakshmi Vyasarajan on 3/21/09.
//  Copyright 2009 Extrazeal. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Colors.h"

@interface ColorsController : NSArrayController {

	IBOutlet NSTableView * colorTable;
	
	@private
	Colors * innerObject;
	Colors * outerObject;
	NSColor * inner;
	NSColor * outer;
}

@property  (retain) NSColor * inner;
@property  (retain) NSColor * outer;

@end
