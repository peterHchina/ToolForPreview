//
//  MainView.m
//  Tool For Preview
//
//  Created by peter on 16/3/12.
//
//

#import "TFPMainView.h"

#define RADIUS 12.0
#define linewidth 1.5
@implementation TFPMainView
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self setWantsLayer:YES];
    
    NSBezierPath *path=[NSBezierPath new];
    [ [NSColor colorWithCalibratedRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1] setFill];
    [path appendBezierPathWithRoundedRect:[self bounds] xRadius:RADIUS yRadius:RADIUS];
    [path fill];

    [self markRingLayer:dirtyRect];
    
}


-(void) markRingLayer:(NSRect) rect {
    CGPoint centerPoint = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    CGFloat ringRadius1 = 20;
    CAShapeLayer *ringLayer1 = [CAShapeLayer layer];
//    ringLayer1.bounds = CGRectMake(0, 0,ringRadius1, ringRadius1);
//    ringLayer1.position = centerPoint;
    CGMutablePathRef path1 =  CGPathCreateMutable();
    CGPathAddArc(path1, NULL, centerPoint.x, centerPoint.y, ringRadius1, 0, 2*M_PI, YES);
    ringLayer1.path = path1;
    ringLayer1.lineWidth = .3;
    ringLayer1.lineJoin = kCALineJoinRound;
    ringLayer1.strokeColor = [NSColor whiteColor].CGColor;
    ringLayer1.fillColor = [NSColor clearColor].CGColor;
    [self.layer addSublayer:ringLayer1];
    
    CGFloat ringRadius2 = 16;
    CAShapeLayer *ringLayer2 = [CAShapeLayer layer];
//    ringLayer2.bounds = CGRectMake(0, 0,ringRadius2, ringRadius2);
//    ringLayer2.position = centerPoint;
    CGMutablePathRef path2 =  CGPathCreateMutable();
    CGPathAddArc(path2, NULL, centerPoint.x, centerPoint.y, ringRadius2, 0, 2*M_PI, YES);
    ringLayer2.path = path2;
    ringLayer2.lineWidth = linewidth;
    ringLayer2.lineJoin = kCALineJoinRound;
    ringLayer2.strokeColor = [NSColor whiteColor].CGColor;
    ringLayer2.fillColor = [NSColor clearColor].CGColor;
    [self.layer addSublayer:ringLayer2];
    
    CGFloat ringRadius3 = 12;
    CAShapeLayer *ringLayer3 = [CAShapeLayer layer];
//    ringLayer3.bounds = CGRectMake(0, 0,ringRadius3, ringRadius3);
//    ringLayer3.position = centerPoint;
    CGMutablePathRef path3 =  CGPathCreateMutable();
    CGPathAddArc(path3, NULL, centerPoint.x, centerPoint.y, ringRadius3, 0, 2*M_PI, YES);
    ringLayer3.path = path3;
    ringLayer3.lineWidth = linewidth;
    ringLayer3.lineJoin = kCALineJoinRound;
    ringLayer3.strokeColor = [NSColor whiteColor].CGColor;
    ringLayer3.fillColor = [NSColor whiteColor].CGColor;
    [self.layer addSublayer:ringLayer3];
}
@end
