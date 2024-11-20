import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AddressViewModel(formatter: EnglishAddressFormatter())

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter postal code", text: $viewModel.postalCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Search") { viewModel.fetchAddress() }
            Text(viewModel.address)
        }
        .padding()
    }
}

// プレビュー
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
