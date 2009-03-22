//
//  ColorsController.m
//  LVColorWellCell
//
//  Created by Lakshmi Vyasarajan on 3/21/09.
//  Copyright 2009 Extrazeal. All rights reserved.
//

#import "ColorsController.h"
#import "LVColorWellCell.h"

@implementation ColorsController

@synthesize inner, outer;

-(void)awakeFromNib{
	innerObject = [[Colors alloc] init];
	[innerObject setArea:@"inner"];
	[innerObject setColor:[NSColor blackColor]];
	outerObject = [[Colors alloc] init];
	[outerObject setArea:@"outer"];
	[outerObject setColor:[NSColor greenColor]];
	[self setContent:[NSArray arrayWithObjects:innerObject, outerObject, nil]];
	NSUInteger index = [colorTable columnWithIdentifier:@"color"];
	if (index >= 0){
		NSTableColumn * colorColumn = [[colorTable tableColumns] objectAtIndex:index];
		LVColorWellCell * colorCell = [[LVColorWellCell alloc] init];
		[colorCell setColorKey:@"color"];
		[colorColumn setDataCell:colorCell];
	}
	[self setInner:[innerObject color]];		
	[self setOuter:[outerObject color]];		
	[innerObject addObserver:self forKeyPath:@"color" options:NSKeyValueObservingOptionNew context:nil];
	[outerObject addObserver:self forKeyPath:@"color" options:NSKeyValueObservingOptionNew context:nil];

}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (object == innerObject) {
		[self setInner:[innerObject color]];		
	}
	else if (object == outerObject) {
		[self setOuter:[outerObject color]];		
	}
	else {
		[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
	}
}

@end
