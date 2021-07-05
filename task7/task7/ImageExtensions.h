//
//  ImageExtensions.h
//  task7
//
//  Created by Alex on 7/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ImageExtensions)
+(UIImage *) imageWithColor:(UIColor *)color;
-(UIImage *) imageWithImage:(UIImage *)image convertToSize: (CGSize)size;
@end

NS_ASSUME_NONNULL_END

