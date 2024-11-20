import SwiftUI

struct ContentView: View {
    // ViewModel instance is created and managed by this View.
    // `@StateObject` ensures that the ViewModel's lifecycle is tied to this view.
    // The initial formatter is set to EnglishAddressFormatter.
    @StateObject private var viewModel = AddressViewModel(formatter: EnglishAddressFormatter())
    
    // A state variable to store the selected language ("English" or "Japanese").
    // It is bound to the Picker component and updates dynamically when the user selects a different language.
    @State private var selectedLanguage = "English"

    var body: some View {
        VStack(spacing: 20) { // Vertically stack the UI components with 20 points of spacing
            
            // Picker for selecting the language (English or Japanese).
            // The selected value is bound to `selectedLanguage`.
            Picker("Language", selection: $selectedLanguage) {
                // Option for English. The associated tag value is "English".
                Text("English").tag("English")
                // Option for Japanese. The associated tag value is "Japanese".
                Text("Japanese").tag("Japanese")
            }
            .pickerStyle(SegmentedPickerStyle()) // Style the Picker as a segmented control for better usability.
            
            // TextField for entering the postal code.
            // The text input is bound to the `postalCode` property in the ViewModel.
            TextField("Enter postal code", text: $viewModel.postalCode)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply a rounded border style to the TextField for a cleaner appearance.
            
            // Button to trigger the search for the address.
            Button("Search") {
                // Dynamically set the formatter in the ViewModel based on the selected language.
                // If `selectedLanguage` is "English", use EnglishAddressFormatter.
                // Otherwise, use JapaneseAddressFormatter.
                viewModel.formatter = selectedLanguage == "English"
                    ? EnglishAddressFormatter()
                    : JapaneseAddressFormatter()
                
                // Fetch the address using the ViewModel's `fetchAddress` method.
                // This will contact the API, retrieve the address data, and format it using the selected formatter.
                viewModel.fetchAddress()
            }
            
            // Display the formatted address fetched from the API.
            // The `address` property in the ViewModel is updated dynamically, and the UI reflects the latest value.
            Text(viewModel.address)
        }
        .padding() // Add padding around the VStack for better spacing and layout.
    }
}

// Preview provider for rendering the ContentView in Xcode's preview canvas.
// Allows developers to visualize the UI without running the app.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
