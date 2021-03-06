//
//  ASN1Tests.swift
//  TPInAppReceipt
//
//  Created by Pavel Tikhonenko on 19.06.20.
//  Copyright © 2019-2020 Pavel Tikhonenko. All rights reserved.
//

import XCTest
@testable import TPInAppReceipt

class PerformanceTests: XCTestCase
{
	var receipt: InAppReceipt!
	
	override func setUp()
	{
		receipt =  try! InAppReceipt(receiptData: defaultDevice.receipt)
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	

	
	func testValidationPerformance() {
		// This is an example of a performance test case.
		self.measure {
			do
			{
				try receipt.verify()
			}catch{
				XCTFail("Unable to verify: \(error)")
			}
		}
	}
	
	func testHashValidationPerformance() {
		// This is an example of a performance test case.
		self.measure {
			do
			{
				try receipt.verifyHash()
			}catch{
				XCTFail("Unable to verify: \(error)")
			}
		}
	}
	
	func testSignatureValidationPerformance() {
		// This is an example of a performance test case.
		self.measure {
			do
			{
				try receipt.verifySignature()
			}catch{
				XCTFail("Unable to verify: \(error)")
			}
		}
	}
	
	func testBundleValidationPerformance() {
		// This is an example of a performance test case.
		self.measure {
			do
			{
				try receipt.verifyBundleIdentifierAndVersion()
			}catch{
				XCTFail("Unable to verify: \(error)")
			}
		}
	}
	
}
