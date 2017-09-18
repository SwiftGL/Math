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


public protocol ArithmeticType : Numeric, Hashable, Strideable {
    init(_: Double)
    init(_: Float)
    init(_: Int)
    init(_: UInt)
    init(_: Int8)
    init(_: UInt8)
    init(_: Int16)
    init(_: UInt16)
    init(_: Int32)
    init(_: UInt32)
    init(_: Int64)
    init(_: UInt64)
    static func /(_: Self, _: Self) -> Self
    static func /=(_: inout Self, _: Self)
    static func %(_: Self, _: Self) -> Self
    static func %=(_: inout Self, _: Self)
}

public protocol FloatingPointArithmeticType : ArithmeticType, FloatingPoint, ExpressibleByFloatLiteral {}
extension Double: FloatingPointArithmeticType {
    public static func %(a: Double, b: Double) -> Double {
        return a.remainder(dividingBy: b)
    }
    public static func %=(a: inout Double, b: Double) {
        a = a.remainder(dividingBy: b)
    }
}
extension Float: FloatingPointArithmeticType {
    public static func %(a: Float, b: Float) -> Float {
        return a.remainder(dividingBy: b)
    }
    public static func %=(a: inout Float, b: Float) {
        a = a.remainder(dividingBy: b)
    }
}

// Swift didn't put these in BitwiseOperationsType
public protocol BitsOperationsType : ArithmeticType, BinaryInteger {
}
extension Int: BitsOperationsType {}
extension UInt: BitsOperationsType {}
extension Int8: BitsOperationsType {}
extension UInt8: BitsOperationsType {}
extension Int16: BitsOperationsType {}
extension UInt16: BitsOperationsType {}
extension Int32: BitsOperationsType {}
extension UInt32: BitsOperationsType {}
extension Int64: BitsOperationsType {}
extension UInt64: BitsOperationsType {}


// Anything not a plain single scalar is considered a Matrix.
// This includes Vectors, Complex, and Quaternion.
public protocol MatrixType : Hashable, CustomDebugStringConvertible, Sequence where Element:ArithmeticType {
    init()
    init(_: Self, _:(_:Element) -> Element)
    init(_: Self, _: Self, _:(_:Element, _:Element) -> Element)
    init(_: Element, _: Self, _:(_:Element, _:Element) -> Element)
    init(_: Self, _: Element, _:(_:Element, _:Element) -> Element)
    prefix static func ++(_: inout Self) -> Self
    postfix static func ++(_: inout Self) -> Self
    prefix static func --(_: inout Self) -> Self
    postfix static func --(_: inout Self) -> Self
    static func +(_: Self, _: Self) -> Self
    static func +=(_: inout Self, _: Self)
    static func +(_: Element, _: Self) -> Self
    static func +(_: Self, _: Element) -> Self
    static func +=(_: inout Self, _: Element)
    static func -(_: Self, _: Self) -> Self
    static func -=(_: inout Self, _: Self)
    static func -(_: Element, _: Self) -> Self
    static func -(_: Self, _: Element) -> Self
    static func -=(_: inout Self, _: Element)
    static func *(_: Element, _: Self) -> Self
    static func *(_: Self, _: Element) -> Self
    static func *=(_: inout Self, _: Element)
    static func /(_: Element, _: Self) -> Self
    static func /(_: Self, _: Element) -> Self
    static func /=(_: inout Self, _: Element)
    static func %(_: Self, _: Self) -> Self
    static func %=(_: inout Self, _: Self)
    static func %(_: Element, _: Self) -> Self
    static func %(_: Self, _: Element) -> Self
    static func %=(_: inout Self, _: Element)
    var elements: [Element] { get }
}

// This protocol is only Vector2, Vector3, and Vector4
public protocol VectorType : MatrixType, ExpressibleByArrayLiteral {
    associatedtype FloatVector
    associatedtype DoubleVector
    associatedtype Int32Vector
    associatedtype UInt32Vector
    associatedtype BooleanVector
    // T.BooleanVector == BooleanVector : Must use this key with mixed types.
    subscript(_:Int) -> Element { get set }
    init<T:VectorType>(_: T, _:(_:T.Element) -> Element) where T.BooleanVector == BooleanVector
    init<T1:VectorType, T2:VectorType>(_:T1, _:T2, _:(_:T1.Element, _:T2.Element) -> Element) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector
    init<T1:VectorType, T2:VectorType>(_:T1, _:inout T2, _:(_:T1.Element, _:inout T2.Element) -> Element) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector
    init<T1:VectorType, T2:VectorType, T3:VectorType>(_:T1, _:T2, _:T3, _:(_:T1.Element, _:T2.Element, _:T3.Element) -> Element) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector, T3.BooleanVector == BooleanVector
    init<T1:VectorType, T2:VectorType, T3:BooleanVectorType>(_:T1, _:T2, _:T3, _:(_:T1.Element, _:T2.Element, _:Bool) -> Element) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector, T3.BooleanVector == BooleanVector
    static func *(_: Self, _: Self) -> Self
    static func *=(_: inout Self, _: Self)
    static func /(_: Self, _: Self) -> Self
    static func /=(_: inout Self, _: Self)
}

// This protocol is only Vector2b, Vector3b, and Vector4b
public protocol BooleanVectorType : Hashable, CustomDebugStringConvertible, Sequence {
    associatedtype BooleanVector
    subscript(_:Int) -> Bool { get set }
    init(_: Self, _:(_:Bool) -> Bool)
    init<T:VectorType>(_: T, _:(_:T.Element) -> Bool) where T.BooleanVector == BooleanVector
    init<T1:VectorType, T2:VectorType>(_:T1, _:T2, _:(_:T1.Element, _:T2.Element) -> Bool) where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector
}
