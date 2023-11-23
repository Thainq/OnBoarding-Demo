//
//  OnboardingBackground.swift
//  OnBoarding
//
//  Created by Thai Nguyen Quang on 11/22/23.
//

import SwiftUI

struct OnboardingBackground: View {
    let backgroundPets = Pet.backgroundPets
    
    
    var body: some View {
        ZStack {
            
            ForEach(backgroundPets) { pet in
                pet.petImage
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .position(pet.position)
            }
        }
    }
}

struct OnboardingBackground_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBackground()
    }
}
