//
//  PetSaveOnboardingView.swift
//  OnBoarding
//
//  Created by Thai Nguyen Quang on 11/22/23.
//

import SwiftUI

public struct PetSaveOnboardingView: View {
    
    @State var currentpageIndex = 0
    
    public init(items: [OnboardingModel]) {
        self.items = items
    }
    
    private var onNext: (_ currentIndex: Int) -> Void = {_ in }
    private var onSkip: () -> Void = {}
    
    private var items: [OnboardingModel] = []
    
    private var nextButtonTitle: String {
        items[currentpageIndex].nextButtonTitle
    }
    
    private var skipButtonTitle: String {
        items[currentpageIndex].skipButtonTitle
    }
    
    public var body: some View {
        if items.isEmpty {
            Text("No items to show.")
        } else {
            VStack {
                //tabView
                TabView(selection: $currentpageIndex){
                    ForEach(0..<items.count) { index in
                        OnboardingView(onboarding: items[index])
                            .tag(index)
                    }
                }
                .padding(.bottom, 10)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .onAppear(perform: setupPageControlAppearance)
                //button
                
                Button(action: next) {
                    Text(nextButtonTitle)
                        .frame(maxWidth: .infinity, maxHeight: 44)
                }
                .buttonStyle(OnboardingButtonStyle(color: .rwDark))
                .animation(nil, value: currentpageIndex)
                
                Button(action: onSkip){
                    Text(skipButtonTitle)
                        .frame(maxWidth: .infinity, maxHeight: 44)
                }
                .buttonStyle(OnboardingButtonStyle(color: .rwGreen))
                .animation(nil, value: currentpageIndex)
                .padding(.bottom, 20)
            }
            .background(OnboardingBackground())
        }
    }
    
    private func setupPageControlAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.rwGreen)
    }
    public func onNext(action: @escaping (_ currentIndex: Int) -> Void) -> Self {
        var petSaveOnboardingView = self
        petSaveOnboardingView.onNext = action
        return petSaveOnboardingView
    }
    
    public func onSkip(action: @escaping () -> Void) -> Self{
        var petSaveOnboardingView = self
        petSaveOnboardingView.onSkip = action
        return petSaveOnboardingView
    }
    
    
    private func next() {
        withAnimation {
            currentpageIndex = currentpageIndex + 1 < items.count ? currentpageIndex + 1 : 0
        }
        onNext(currentpageIndex)
    }
}

struct PetSaveOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        PetSaveOnboardingView(items: mockOnboardingModel)
    }
}

fileprivate extension PreviewProvider {
    
    static var mockOnboardingModel: [OnboardingModel] {
        [
            OnboardingModel(
                title: "Welcome to\n PetSave",
                description: "Looking for a Pet?\n Then you're at the right place",
                image: .bird,
                nextButtonTitle: "Next",
                skipButtonTitle: "Skip"
            ),
            OnboardingModel(
              title: "Search...",
              description: "Search from a list of our huge database of animals.",
              image: .dogBoneStand,
              nextButtonTitle: "Allow",
              skipButtonTitle: "Skip"
            ),
            OnboardingModel(
              title: "Nearby",
              description: "Find pets to adopt from nearby your place...",
              image: .chameleon,
              nextButtonTitle: "Next",
              skipButtonTitle: "Skip"
            )
        
        ]
    }
     
}

struct OnboardingButtonStyle: ButtonStyle {
  let color: Color
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background(color)
      .clipShape(Capsule())
      .buttonStyle(.plain)
      .padding(.horizontal, 20)
      .foregroundColor(.white)
  }
}

