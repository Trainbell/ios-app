//
//  CornerRadiusModifier.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 15/04/24.
//

import Foundation
import SwiftUI

struct CornerRadiusModifier: ViewModifier {
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(radius)
            .edgesIgnoringSafeArea(.bottom)
    }
}
