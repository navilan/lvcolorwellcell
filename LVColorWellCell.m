//
//  LVColorWellCell.m
//  
//
//  Created by Lakshmi Vyasarajan on 3/19/09.
//  Copyright 2009 Ringce. MIT License.
//
//	Version: 0.5 Beta
//
#import "LVColorWellCell.h"

@interface LVColorWellCell()

-(NSColor *)color:(id)sender;
-(void)setColor:(NSColor *) color;

@end

@implementation LVColorWellCell

@synthesize colorKey, delegate;

-(id)init{
	self = [super init];
	if (self){
		[self setTarget:self];
		[self setAction:@selector(showPicker:)];	
	}
	return self;
}

-(void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView{
	[NSGraphicsContext saveGraphicsState];
	[[NSColor whiteColor] setStroke];	
	NSBezierPath * path = [NSBezierPath bezierPathWithRect:cellFrame];
	[path setLineWidth:1];
	[path stroke];	
	cellFrame = NSInsetRect(cellFrame, 2.0, 2.0);
	NSColor * color = (NSColor *)[self objectValue];
	if ( [color respondsToSelector:@selector(setFill)] ){
		[color drawSwatchInRect:cellFrame];
	}
	[NSGraphicsContext restoreGraphicsState];
}

-(NSColor *)color:(id)sender{
	if (sender == nil || [sender clickedRow] == -1){
		return [self objectValue];
	}
	colorRow = [sender clickedRow];
	if ([self delegate] && [[self delegate] respondsToSelector:@selector(colorCell:colorForRow:)]){
		return [delegate colorCell:self colorForRow:colorRow];
	}
	colorObject = [[[sender dataSource] arrangedObjects] objectAtIndex:[sender clickedRow]];
	return [colorObject valueForKey:[self colorKey]];
}

-(void)setColor:(NSColor *) color{
	if ([self delegate] && [[self delegate] respondsToSelector:@selector(colorCell:setColor:forRow:)]){
		return [delegate colorCell:self setColor:color forRow:colorRow];
	}
	[colorObject setValue:color forKey:[self colorKey]];
}
	
-(void)showPicker:(id)sender{
	[[NSColorPanel sharedColorPanel] setContinuous:YES];
	[[NSColorPanel sharedColorPanel] setShowsAlpha:YES];
	[[NSColorPanel sharedColorPanel] setTarget:self];
	[[NSColorPanel sharedColorPanel] setAction:@selector(colorChanged:)];
	[[NSColorPanel sharedColorPanel] setColor:[self color:sender]];
	[[NSColorPanel sharedColorPanel] makeKeyAndOrderFront:self];
}

-(void)colorChanged:(id)sender{
	[self setColor: [[NSColorPanel sharedColorPanel] color]];
}

@end
