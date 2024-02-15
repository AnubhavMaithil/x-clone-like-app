//
//  RoundedShape.swift
//  teetar
//
//  Created by Anubhav Maithil on 12/02/24.
//

import SwiftUI

struct RoundedShape: Shape {
    
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 90, height: 90))
        
        return Path(path.cgPath)
    }
    
}
