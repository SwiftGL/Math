# SwiftGL Math Library

SwiftGL is libraries for graphics programming that's 100% Swift.

To use, include dependency in your `Package.swift`:
```swift
let package = Package(
    dependencies: [
        .Package(url: "https://github.com/SwiftGL/Math.git", majorVersion: 2)
    ]
)
```
Then `import SGLMath` in your swift file.

## Getting Started

The SwiftGL math library is an implementation of every data type and operator
in the GLSL 4.5 specification. It includes every operator in section 5.1 and every
function in sections 8.1 to 8.7. You can even swizzle.

Swift syntax and GLSL syntax are naturally very similar. With the same types and functions
available in both you may not even notice when you switch between them. That's exactly
the point of this library. Everything you know and use in GLSL will now work in Swift.
```swift
var myVec = vec4(1, 2, 3, 4)
myVec.ab = vec2(99, 98)
print(myVec) //=> (1, 2, 98, 99)
```
Arrays and structures of SwiftGL math types can be passed directly to OpenGL. The binary
formats for all types are an exact match.
```swift
let vertices = [vec3](count: 100, repeatedValue: vec3())
glBufferData(target: GL_ARRAY_BUFFER, size: strideof(vec3) * vertices.count,
             data: vertices, usage: GL_STATIC_DRAW)
```
You may find that you have a type with the wrong scalar. The Swift thing to do is construct
a new one from the old one. That also happens to be how you do it in GLSL. From section 5.1
of the spec: "There is no typecast operator; constructors are used instead."
```swift
let f = Float(3.1)
let d = Double(f)
let v = vec3()
let dv = dvec3(v)
```
The glm library for C++ is one of the most used math libraries for OpenGL. Like SwiftGL,
it implements the GLSL specification. It also provides additional functions to support
things like quaternions and cameras. The SwiftGL math module contains matrix
transformations compatible with glm.
```swift
let projectionMatrix = mat4.perspective(fov, aspect, clip.near, clip.far)
```

## Regenerate Swizzle.swift

From the root directory of the package execute:
`./.build/x86_64-unknown-linux/debug/swizgen`