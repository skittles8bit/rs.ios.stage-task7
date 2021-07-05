//
//  ColorExtensions.m
//  task7
//
//  Created by Alex on 7/5/21.
//

#import "ColorExtensions.h"

@implementation UIColor (ColorExtensions)

+ (UIColor *) rsBlackCoral
{
  return [UIColor colorWithRed:76.0/255.0 green:92.0/255.0 blue:104.0/255.0 alpha:1.0];
}
+ (UIColor *) rsTorquoiseGreen
{
  return [UIColor colorWithRed:145.0/255.0 green:199.0/255.0 blue:177.0/255.0 alpha:1.0];
}

+ (UIColor *) rsVenetialRed
{
  return [UIColor colorWithRed:194.0/255.0 green:1.0/255.0 blue:20.0/255.0 alpha:1.0];
}
+ (UIColor *) rsLittleBoyBlue:(CGFloat)alpha
{
  return [UIColor colorWithRed:128.0/255.0 green:164.0/255.0 blue:237.0/255.0 alpha:alpha];
}

@end
