//
//  ClipSelectionPanel.swift
//  myFirstVideoEditor
//
//  Created by Guido Grassel on 05/10/14.
//  Copyright (c) 2014 Guido Grassel. All rights reserved.
//

import Foundation
import Cocoa
import AVFoundation;

class ClipSelectionPanel: NSPanel {
   
    func enumerateClips() {
        var filemgr : NSFileManager = NSFileManager.defaultManager();
        if let moviesDirectory = filemgr.URLForDirectory(NSSearchPathDirectory.MoviesDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false, error: nil) {
        
            println("Looking for clips at \(moviesDirectory.path) ...");
                
     //       var clips : NSArray! = filemgr.contentsOfDirectoryAtPath(moviesDirectory.path!, error: nil)
            var properties = NSArray(objects: NSURLLocalizedNameKey, NSURLCreationDateKey, NSURLLocalizedTypeDescriptionKey)
             var clips : NSArray! = filemgr.contentsOfDirectoryAtURL(moviesDirectory, includingPropertiesForKeys: properties, options: NSDirectoryEnumerationOptions.SkipsSubdirectoryDescendants, error: nil)
            if clips != nil {
                for index in 0...clips!.count-1 {
                    var clipPath = clips[index] as NSURL
                    println("   \(clipPath)");

                    var avasset : AVAsset = AVURLAsset(URL: clipPath, options: nil)
                    
                    var generator : AVAssetImageGenerator = AVAssetImageGenerator(asset: avasset);
                    generator.appliesPreferredTrackTransform = true;
                    var time : CMTime = CMTimeMake(1,2);
                    var imageDimen = CGSize(width: 240, height: 160)
                    generator.maximumSize = imageDimen
                    var oneRef : CGImageRef = generator.copyCGImageAtTime(time, actualTime: nil, error: nil);
                    var image : NSImage = NSImage(CGImage: oneRef, size: imageDimen)
                }
            }
            

        } else {
            println("ERROR: Failed to locate user's Movies directory");
            return;
        }
        
    }
    
}
