//
//  ContentView.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 18/10/20.
//

import SwiftUI

struct LoginView: View {
	var body: some View {
		ZStack {
			VStack {
				LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .top, endPoint: .bottom)
				.mask(
					VStack(spacing: 0) {
						Color.clear.frame(width: 1, height: 80)
						Image("city-skyline")
						.resizable().scaledToFit()
						Color.white.frame(maxWidth: .infinity, maxHeight: .infinity)
					}
				)
			}
			
			VStack {
				Image("strataly-logo")
					.resizable()
					.scaledToFit()
				
				Spacer()
				
				Button("Login") {
					// CALL LOGIN FUNCTION
				}
				.padding()
				
				Spacer()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
