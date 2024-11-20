import Foundation

// ViewModel class that serves as the bridge between the View (UI) and the Model (data).
// It handles user input (postal code), API communication, and data formatting for display in the UI.
class AddressViewModel: ObservableObject {
    // The postal code entered by the user. Changes to this value will notify the View to update.
    @Published var postalCode: String = ""

    // The formatted address to be displayed in the UI. Initially set to a placeholder.
    @Published var address: String = "Address will be displayed here"

    // The formatter used to format the fetched address into the desired style (English or Japanese).
    // This property is dynamically changeable based on user selection.
    @Published var formatter: AddressFormatter

    // Initializer to set the default formatter.
    // The formatter is passed in as a dependency, adhering to the dependency injection principle.
    init(formatter: AddressFormatter) {
        self.formatter = formatter
    }

    // Fetches the address associated with the current postal code by making an API call.
    fileprivate func handlingdataadress(_ data: Data?) {
        // Ensure `self` is weakly captured to prevent memory leaks.
        // Process the response if data is available.
        if let data = data,
           // Decode the JSON response into the `JPPostalCodeResponse` structure.
           let response = try? JSONDecoder().decode(JPPostalCodeResponse.self, from: data),
           // Extract the first address from the response if available.
           let addressData = response.addresses.first {
            // Update the UI on the main thread.
            DispatchQueue.main.async {
                // Format the fetched address using the current formatter and assign it to `address`.
                self.address = self.formatter.format(addressData)
            }
        }
    }
    
    func fetchAddress() {
        // Sanitize the postal code by removing hyphens.
        // The API expects a postal code without any formatting.
        let sanitizedPostalCode = postalCode.replacingOccurrences(of: "-", with: "")

        // Construct the API URL using the sanitized postal code.
        let urlString = "https://jp-postal-code-api.ttskch.com/api/v1/\(sanitizedPostalCode).json"
        guard let url = URL(string: urlString) else {
            return // Exit if the URL is invalid.
        }

        // Perform the API request using URLSession.
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            self?.handlingdataadress(data)
        }.resume() // Start the API request.
    }
}
