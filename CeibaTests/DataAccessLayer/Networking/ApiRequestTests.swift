//
//  ApiRequestTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 10/07/21.
//

import XCTest
@testable import Ceiba
@testable import Alamofire

class ApiRequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiRequest_Init_Success() {
        let params: Parameters? = nil
        let headers: HTTPHeaders? = nil
        let encoding = HTTPBodyEncoding.json
        
        let sut = ApiRequest(url: "", method: HTTPMethod.get, parameters: params, headers: headers, encoding: encoding)
        
        XCTAssert(sut.url == "")
        XCTAssert(sut.method == HTTPMethod.get)
        XCTAssert(sut.parameters?.keys == params?.keys)
        XCTAssert(sut.headers?.dictionary == headers?.dictionary)
        XCTAssert(sut.encoding as! HTTPBodyEncoding == encoding)
    }
}
