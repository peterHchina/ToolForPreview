//
//  TFPCenterView.m
//  Tool For Preview
//
//  Created by peter on 16/3/12.
//
//

#import "TFPCenterView.h"

@implementation TFPCenterView
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSBezierPath *path=[NSBezierPath new];
    [ [NSColor colorWithWhite:1 alpha:1] setFill];
    [path appendBezierPathWithRoundedRect:[self bounds] xRadius:self.bounds.size.width/2 yRadius:self.bounds.size.width/2];
    [path fill];
    
    
}
@end
