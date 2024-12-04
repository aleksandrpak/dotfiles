#!/usr/bin/swift

import Foundation
import Carbon

func addInputSource(inputSourceID: String) {
    let properties: [CFString: Any] = [
        kTISPropertyInputSourceID: inputSourceID
    ]

    guard let inputSourceListCF = TISCreateInputSourceList(properties as CFDictionary, true) else {
        print("Failed to create input source list.")
        return
    }

    let inputSourceList = inputSourceListCF.takeRetainedValue() as NSArray as? [TISInputSource]

    guard let inputSource = inputSourceList?.first else {
        print("Input source not found.")
        return
    }

    // Enable the input source
    let statusEnable = TISEnableInputSource(inputSource)
    if statusEnable == noErr {
        print("Input source added successfully.")
    } else {
        print("Failed to add input source.")
    }
}

addInputSource(inputSourceID: "com.apple.keylayout.Russian")

