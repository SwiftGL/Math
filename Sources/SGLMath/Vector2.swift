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


public struct Vector2<T:ArithmeticType> : VectorType {

    public typealias Element = T
    public typealias FloatVector = Vector2<Float>
    public typealias DoubleVector = Vector2<Double>
    public typealias Int32Vector = Vector2<Int32>
    public typealias UInt32Vector = Vector2<UInt32>
    public typealias BooleanVector = Vector2b

    public var x:T, y:T

    public var r:T { get {return x} set {x = newValue} }
    public var g:T { get {return y} set {y = newValue} }

    public var s:T { get {return x} set {x = newValue} }
    public var t:T { get {return y} set {y = newValue} }

    public var elements: [Element] {
        return [x, y]
    }

    public func makeIterator() -> IndexingIterator<Array<Element>> {
        return elements.makeIterator()
    }

    public subscript(index: Int) -> T {
        get {
            switch(index) {
            case 0: return x
            case 1: return y
            default: preconditionFailure("Vector index out of range")
            }
        }
        set {
            switch(index) {
            case 0: x = newValue
            case 1: y = newValue
            default: preconditionFailure("Vector index out of range")
            }
        }
    }

    public var debugDescription: String {
        return String(describing: type(of:self)) + "(\(x), \(y))"
    }

    public var hashValue: Int {
        return SGLMath.hash(x.hashValue, y.hashValue)
    }

    public init () {
        self.x = 0
        self.y = 0
    }

    public init (_ v:T) {
        self.x = v
        self.y = v
    }

    public init(_ array:[T]) {
        precondition(array.count == 2, "Vector2 requires a 2-element array")
        self.x = array[0]
        self.y = array[1]
    }

    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }

    public init (_ x:T, _ y:T) {
        self.x = x
        self.y = y
    }

    public init (x:T, y:T) {
        self.x = x
        self.y = y
    }

    public init (r:T, g:T) {
        self.x = r
        self.y = g
    }

    public init (s:T, t:T) {
        self.x = s
        self.y = t
    }

    public init (_ v:Vector2<T>) {
        self.x = v.x
        self.y = v.y
    }

    public init (_ v:Vector3<T>) {
        self.x = v.x
        self.y = v.y
    }

    public init (_ v:Vector4<T>) {
        self.x = v.x
        self.y = v.y
    }

    public init (_ v:Vector2<Double>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<Float>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<Int>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<UInt>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<Int8>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<UInt8>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<Int16>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<UInt16>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<Int32>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<UInt32>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<Int64>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ v:Vector2<UInt64>) {
        self.x = T(v.x)
        self.y = T(v.y)
    }

    public init (_ s:T, _ v:Vector2<T>, _ op:(_:T, _:T) -> T) {
        self.x = op(s, v.x)
        self.y = op(s, v.y)
    }

    public init (_ v:Vector2<T>, _ s:T, _ op:(_:T, _:T) -> T) {
        self.x = op(v.x, s)
        self.y = op(v.y, s)
    }

    public init<T:VectorType>(_ v: T, _ op:(_:T.Element) -> Element) where T.BooleanVector == BooleanVector {
            self.x = op(v[0])
            self.y = op(v[1])
    }

    public init<T1:VectorType, T2:VectorType>(_ v1:T1, _ v2:T2, _ op:(_:T1.Element, _:T2.Element) -> Element) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector {
            self.x = op(v1[0], v2[0])
            self.y = op(v1[1], v2[1])
    }

    public init<T1:VectorType, T2:VectorType>(_ v1:T1, _ v2:inout T2, _ op:(_:T1.Element, _:inout T2.Element) -> Element) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector {
            self.x = op(v1[0], &v2[0])
            self.y = op(v1[1], &v2[1])
    }

    public init<T1:VectorType, T2:VectorType, T3:VectorType>(_ v1:T1, _ v2:T2, _ v3:T3, _ op:(_:T1.Element, _:T2.Element, _:T3.Element) -> Element) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector, T3.BooleanVector == BooleanVector {
            self.x = op(v1[0], v2[0], v3[0])
            self.y = op(v1[1], v2[1], v3[1])
    }

    public init<T1:VectorType, T2:VectorType, T3:BooleanVectorType>(_ v1:T1, _ v2:T2, _ v3:T3, _ op:(_:T1.Element, _:T2.Element, _:Bool) -> Element) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector, T3.BooleanVector == BooleanVector {
            self.x = op(v1[0], v2[0], v3[0])
            self.y = op(v1[1], v2[1], v3[1])
    }

    public static func ==(v1: Vector2<T>, v2: Vector2<T>) -> Bool {
        return v1.x == v2.x && v1.y == v2.y
    }
}
