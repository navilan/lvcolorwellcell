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
	id clickedColorObject;	
	id clickedTableView;	
}

@property (readwrite, copy) NSString * colorKey;
IBOutlet @property (readwrite, copy) id delegate;

@end

@protocol LVColorWellCellDelegate
-(void)colorCell:(LVColorWellCell *)colorCell 	
	   tableView:(NSTableView *)tableView
		setColor:(NSColor *)color;

-(NSColor *)colorCell:(LVColorWellCell *)colorCell 	
	colorForTableView:(NSTableView *)tableView;

@end