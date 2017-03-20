//
//  UIImageView+UIImageView_FaceAwareFill.h
//  faceAwarenessClipping
//
//  Created by Julio Andrés Carrettoni on 03/02/13.
//  Copyright (c) 2013 Julio Andrés Carrettoni. All rights reserved.
//
//  https://github.com/Julioacarrettoni/UIImageView_FaceAwareFill
// 此类别将Aspect Fill内容模式应用于图像，并且如果检测到面部，则它将它们居中，而不是仅通过其几何中心使图像居中。


#import <UIKit/UIKit.h>

@interface UIImageView (FaceAwareFill)

//Ask the image to perform an "Aspect Fill" but centering the image to the detected faces
//Not the simple center of the image
- (void) faceAwareFill;

@end
