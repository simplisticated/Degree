//
//  Gradient.swift
//  Degree
//
//  Created by Igor Matyushkin on 21.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public struct Gradient {
    var startPoint: GradientPoint
    var endPoint: GradientPoint
    var steps: [GradientStep]
    
    internal init(startPoint: GradientPoint, endPoint: GradientPoint, steps: [GradientStep]) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.steps = steps
    }
}

public extension Gradient {
    
    public class Builder {
        
        fileprivate var startPoint: GradientPoint
        
        fileprivate var endPoint: GradientPoint
        
        fileprivate var steps: [GradientStep]!
        
        public var get: Gradient {
            get {
                return Gradient(
                    startPoint: self.startPoint,
                    endPoint: self.endPoint,
                    steps: self.steps
                )
            }
        }
        
        fileprivate init() {
            self.startPoint = .topLeft
            self.endPoint = .bottomRight
            self.steps = []
        }
        
        public func from(_ point: GradientPoint) -> Self {
            self.startPoint = point
            return self
        }
        
        public func to(_ point: GradientPoint) -> Self {
            self.endPoint = point
            return self
        }
        
        public func step(withColor color: UIColor, andLocation location: Float) -> Self {
            self.steps.append(
                GradientStep(
                    color: color,
                    location: location
                )
            )
            return self
        }
    }
    
}

public extension Gradient {
    
    public class SmoothBuilder {
        
        fileprivate var startPoint: GradientPoint
        
        fileprivate var endPoint: GradientPoint
        
        fileprivate var colors: [UIColor]!
        
        public var get: Gradient {
            get {
                var steps = [GradientStep]()
                let stepSize = 1.0 / Float(self.colors.count + 1)
                
                for i in 0..<self.colors.count {
                    let color = self.colors[i]
                    let location = stepSize * Float(i + 1)
                    let step = GradientStep(
                        color: color,
                        location: location
                    )
                    steps.append(step)
                }
                
                return Gradient(
                    startPoint: self.startPoint,
                    endPoint: self.endPoint,
                    steps: steps
                )
            }
        }
        
        fileprivate init() {
            self.startPoint = .topLeft
            self.endPoint = .bottomRight
            self.colors = []
        }
        
        public func from(_ point: GradientPoint) -> Self {
            self.startPoint = point
            return self
        }
        
        public func to(_ point: GradientPoint) -> Self {
            self.endPoint = point
            return self
        }
        
        public func step(withColor color: UIColor) -> Self {
            self.colors.append(color)
            return self
        }
        
    }
    
}

public extension Gradient {
    
    public static var make: Builder {
        get {
            return Builder()
        }
    }
    
    public static var makeSmooth: SmoothBuilder {
        get {
            return SmoothBuilder()
        }
    }
    
}
