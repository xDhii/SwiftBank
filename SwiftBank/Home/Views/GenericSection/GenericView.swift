//
//  LoanView.swift
//  SwiftBank
//
//  Created by Alura on 31/12/23.
//

import SwiftUI

struct GenericView: View {
	// MARK: - Attributes

	@EnvironmentObject private var routerManager: NavigationRouter
	let genericResponse: GenericSectionResponse

	// MARK: - UI Components

	private let grayColor = Color(red: 243.0 / 255.0,
	                              green: 243.0 / 255.0,
	                              blue: 243.0 / 255.0)

	var body: some View {

		NavigationStack(path: $routerManager.router) {
			Button {
				print("Deeplink: \(genericResponse.deeplink ?? "")")
				let routerHandler = RouterHandler()
				guard let deeplink = URL(string: genericResponse.deeplink ?? "") else {
					return
				}
				Task {
					if let route = await routerHandler.find(from: deeplink) {
						let routerManager = NavigationRouter.shared
						routerManager.push(to: route)
					}
				}
			} label: {
				RoundedRectangle(cornerRadius: 7)
					.frame(maxWidth: .infinity)
					.frame(height: 80)
					.foregroundColor(.white)
					.clipShape(RoundedRectangle(cornerRadius: 7))
					.shadow(color: Color.gray.opacity(0.5), radius: 7, x: 0, y: 2)
					.overlay(
						VStack(alignment: .leading) {
							header
								.padding(.top, 20)
								.padding(.horizontal)
							textMessage
								.padding(.horizontal)
							Spacer()
						}
					)
					.navigationDestination(for: Route.self, destination: { $0 })
			}
		}
	}

	var header: some View {
		VStack {
			HStack {
				Text(genericResponse.title.text)
					.font(.system(size: CGFloat(genericResponse.title.fontSize)))
					.fontWeight(.medium)
				Spacer()
				Image(systemName: "chevron.right")
					.font(.system(size: 10))
			}
			.padding(.bottom, 2)
		}
	}

	var textMessage: some View {
		HStack {
			Text(genericResponse.subtitle.text)
				.font(.system(size: CGFloat(genericResponse.subtitle.fontSize)))
				.fontWeight(.light)
				.lineSpacing(5)
				.multilineTextAlignment(.leading)
		}
	}
}

struct LoanView_Previews: PreviewProvider {
	static var previews: some View {
		GenericView(
			genericResponse: GenericSectionResponse(
				title: TextModel(text: "Empréstimo", fontSize: 16, color: "#CCCCCC"),
				subtitle: TextModel(text: "Simule seu crédito e antecipe seus planos!", fontSize: 12, color: "#CCCCCC")
			)
		)
		.previewLayout(.sizeThatFits)
	}
}
