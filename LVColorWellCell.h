//
//  LVColorWellCell.h
//  
//
//  Created by Lakshmi Vyasarajan on 3/19/09.
//  Copyright 2009 Ringce. MIT License.
//

#import <Cocoa/Cocoa.h>

@interface LVColorWellCell : NSActionCell {
	
	@private
	id delegate;
	NSString * colorKey;
	id colorObject;	
	int colorRow;	
}

@property (readwrite, copy) NSString * colorKey;
IBOutlet @property (readwrite, assign) id delegate;

@end

@protocol LVColorWellCellDelegate
-(void)colorCell:(LVColorWellCell *)colorCell 	
			setColor:(NSColor *)color 
			forRow:(int)row;

-(NSColor *)colorCell:(LVColorWellCell *)colorCell 	
			colorForRow:(int)row;

@end