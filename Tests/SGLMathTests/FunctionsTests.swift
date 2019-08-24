// Copyright (c) 2015-2016 David Turnbull
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and/or associated documentation files (the
// "Materials"), to deal in the Materials without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Materials, and to
// permit persons to whom the Materials are furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Materials.
//
// THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.

import XCTest
import SGLMath

class FunctionsTests: XCTestCase {

    func testIsNanIsInf() {
        let vf = vec4(Float.infinity, 1, Float.nan, 0)

        let vn = bvec4(false, false, true, false)
        XCTAssertEqual(isnan(vf), vn)

        let vi = bvec4(true, false, false, false)
        XCTAssertEqual(isinf(vf), vi)
    }

    func testPackNorm() {
        let v2i = vec2(-0.7, 0.4)
        let u2s = packSnorm2x16(v2i)
        let u2i = packUnorm2x16(v2i)
        let v2os = unpackSnorm2x16(u2s)
        let v2ou = unpackUnorm2x16(u2i)
        XCTAssertEqualWithAccuracy(v2os, v2i, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(v2ou, vec2(0, 0.4), accuracy: 0.0001)

        let v4i = vec4(0.0, -0.7, 0.4, 1.0)
        let u4s = packSnorm4x8(v4i)
        let u4i = packUnorm4x8(v4i)
        let v4os = unpackSnorm4x8(u4s)
        let v4ou = unpackUnorm4x8(u4i)
        XCTAssertEqualWithAccuracy(v4os, v4i, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(v4ou, vec4(0, 0, 0.4, 1), accuracy: 0.01)

    }

    func testPackDouble() {
        let d = 3.14159
        let v = unpackDouble2x32(d)
        let o = packDouble2x32(v)
        XCTAssertEqual(d, o)
    }

    func testPackHalf() {
        let v = vec2(3.14159, 2.71828)
        let p = packHalf2x16(v)
        let u = unpackHalf2x16(p)
        XCTAssertEqualWithAccuracy(u, v, accuracy: 0.001)
    }

    static var allTests = [
        ("testIsNanIsInf", testIsNanIsInf),
        ("testPackNorm", testPackNorm),
        ("testPackDouble", testPackDouble),
        ("testPackHalf", testPackHalf)
    ]
}
