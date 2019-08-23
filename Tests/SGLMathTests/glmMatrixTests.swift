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

class SwiftGLglmTests: XCTestCase {

    func testGenericLink() {
        // Nothing asserts here.
        // Just making sure the generics will link.

        let m4 = mat4()
        let v2 = vec2(1)
        let v3 = vec3()
        let v4 = vec4()

        _ = SGLMath.translate(m4, v3)
        _ = SGLMath.rotate(m4, 1.1, v3)
        _ = SGLMath.rotateSlow(m4, 1.1, v3)
        _ = SGLMath.scale(m4, v3)

        _ = SGLMath.ortho(1, 2, 3, 4, 5, 6)
        _ = SGLMath.ortho(1, 2, 3, 4)
        _ = SGLMath.orthoLH(1, 2, 3, 4, 5, 6)
        _ = SGLMath.orthoRH(1, 2, 3, 4, 5, 6)

        _ = SGLMath.frustum(1, 2, 3, 4, 5, 6)
        _ = SGLMath.frustumLH(1, 2, 3, 4, 5, 6)
        _ = SGLMath.frustumRH(1, 2, 3, 4, 5, 6)

        _ = SGLMath.perspective(1, 2, 3, 4)
        _ = SGLMath.perspectiveLH(1, 2, 3, 4)
        _ = SGLMath.perspectiveRH(1, 2, 3, 4)

        _ = SGLMath.perspectiveFov(1, 2, 3, 4, 5)
        _ = SGLMath.perspectiveFovLH(1, 2, 3, 4, 5)
        _ = SGLMath.perspectiveFovRH(1, 2, 3, 4, 5)

        _ = SGLMath.infinitePerspective(1, 2, 3)
        _ = SGLMath.infinitePerspectiveLH(1, 2, 3)
        _ = SGLMath.infinitePerspectiveRH(1, 2, 3)

        _ = SGLMath.project(v3, m4, m4, v4)
        _ = SGLMath.unproject(v3, m4, m4, v4)
        _ = SGLMath.pickMatrix(v2, v2, v4)

        _ = SGLMath.lookAt(v3, v3, v3)
        _ = SGLMath.lookAtLH(v3, v3, v3)
        _ = SGLMath.lookAtRH(v3, v3, v3)
    }

}
