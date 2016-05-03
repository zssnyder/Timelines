//
//  TLImage.swift
//  Timelines
//
//  Created by Zack Snyder on 3/12/16.
//  Copyright © 2016 Zack Snyder. All rights reserved.
//

import Foundation
import GPUImage

class TLImage : UIImage {
    
    func invertImageColors(image: UIImage) -> UIImage {
        
        let gImage = GPUImagePicture(image: image)
        let filter = GPUImageColorInvertFilter()
//
        gImage.addTarget(filter)
        filter.useNextFrameForImageCapture()
        gImage.processImage()
        
        return gImage.imageFromCurrentFramebuffer() //filter.imageFromCurrentFramebuffer()
    }
    
//    func calculateScaledHeightFromWidth(width: CGFloat, originalSize: CGSize) -> CGFloat {
//        return ((width * originalSize.height) / originalSize.width)
//    }
    
    func fixImageViewScaling(viewFrame: CGRect, unscaledSize: CGSize) -> CGRect {
        let scaledSizeHeight = ((viewFrame.width * unscaledSize.height) / unscaledSize.width)
        let scaledSize = CGSize(width: viewFrame.width, height: scaledSizeHeight)
        let newFrame = CGRect(origin: viewFrame.origin, size: scaledSize)
        return newFrame
    }
    
    func scaleImageToSize(image: UIImage, size: CGSize, smooth: Bool) -> UIImage {
        
        let gImage = GPUImagePicture(image: image, smoothlyScaleOutput: smooth)
        let filter = GPUImageFilter()
        filter.forceProcessingAtSizeRespectingAspectRatio(size)
        
        gImage.addTarget(filter)
        filter.useNextFrameForImageCapture()
        gImage.processImage()
        
        return filter.imageFromCurrentFramebuffer()
    }
    
    func scaleImage(image: UIImage, respectingAspectRatio toWidth: CGFloat) -> UIImage {
        
        let gImage = GPUImagePicture(image: image)
        let filter = GPUImageFilter()
        
        var scaleSize = CGSizeZero
        scaleSize.width = toWidth
        scaleSize.height = ((toWidth * image.size.height) / image.size.width)
        
        filter.forceProcessingAtSize(scaleSize)
        
        gImage.addTarget(filter)
        filter.useNextFrameForImageCapture()
        gImage.processImage()
        
        return filter.imageFromCurrentFramebuffer()
        
    }
    
    func convertImageToBlackAndWhite(image: UIImage) -> UIImage {
        
        let gImage = GPUImagePicture(image: image)
        let filter = GPUImageLuminanceThresholdFilter()
        
        gImage.addTarget(filter)
        filter.useNextFrameForImageCapture()
        gImage.processImage()
        
        return filter.imageFromCurrentFramebuffer()
    }
}