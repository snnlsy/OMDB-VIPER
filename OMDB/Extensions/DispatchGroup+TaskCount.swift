//
//  DispatchGroup+TaskCount.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 26.09.2023.
//

import Foundation

public extension DispatchGroup {
    
    private struct AssociatedKeys {
        /// Keys used for associating additional properties with DispatchGroup instances
        static let taskCount = UnsafeRawPointer(bitPattern: "DispatchGroup_taskCount".hashValue)!
    }
    
    /// Tracks the count of active tasks within the DispatchGroup
    private(set) var taskCount: Int {
        get {
            objc_sync_enter(self)
            defer { objc_sync_exit(self) }
            return objc_getAssociatedObject(self, AssociatedKeys.taskCount) as? Int ?? 0
        }
        set {
            objc_sync_enter(self)
            defer { objc_sync_exit(self) }
            objc_setAssociatedObject(self, AssociatedKeys.taskCount, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// Indicates whether there are any active tasks in the DispatchGroup.
    var hasActiveTasks: Bool {
        taskCount > 0
    }
    
    /// Enters a task into the DispatchGroup and increments the active task count.
    func enterTask() {
        objc_sync_enter(self)
        taskCount += 1
        objc_sync_exit(self)
        self.enter()
    }
    
    /// Leaves a task from the DispatchGroup, decrementing the active task count.
    /// Ensures that calls are balanced by asserting if taskCount is already zero.
    func leaveTask() {
        objc_sync_enter(self)
        guard taskCount > 0 else {
            objc_sync_exit(self)
            assertionFailure("Unbalanced taskLeave call")
            return
        }
        taskCount -= 1
        objc_sync_exit(self)
        self.leave()
    }
}
