//
//  DispatchGroup+Extension.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 26.09.2023.
//

import Foundation

extension DispatchGroup {
    
    private struct AssociatedKeys {
        static var enterCount = "enterCount"
    }
    
    private var enterCount: Int {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.enterCount) as? Int ?? 0
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.enterCount, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func countedEnter() {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        
        self.enter()
        enterCount += 1
    }
    
    func countedLeave() {
        self.leave()
        enterCount -= 1
    }
    
    func getEnterCount() -> Int {
        return enterCount
    }
}
