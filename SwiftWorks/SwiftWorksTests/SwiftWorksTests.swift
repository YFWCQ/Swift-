//
//  SwiftWorksTests.swift
//  SwiftWorksTests
//
//  Created by Medalands on 15/4/23.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

import UIKit
import XCTest

class SwiftWorksTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
//    删除链表的倒数第N个节点
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let dumyHead = ListNode(0)
        dumyHead.next = head;
        
        var p:ListNode? = dumyHead
        p = dumyHead
        var q:ListNode?
        q = dumyHead
        
        for _ in 0 ... n {
            q = q?.next
        }
        
        while q != nil {
           q = q?.next
           p = p?.next
        }
        
        let willDeleteNode = p?.next
        p?.next = willDeleteNode?.next
        
        return dumyHead.next
    }
    
}
