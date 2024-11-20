import Foundation

class AddressViewModel: ObservableObject {
    @Published var postalCode: String = ""
    @Published var address: String = "Address will be displayed here"
    private let formatter: AddressFormatter

    init(formatter: AddressFormatter) {
        self.formatter = formatter
    }

    func fetchAddress() {
        let sanitizedPostalCode = postalCode.replacingOccurrences(of: "-", with: "")
        let urlString = "https://jp-postal-code-api.ttskch.com/api/v1/\(sanitizedPostalCode).json"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data,
               let response = try? JSONDecoder().decode(JPPostalCodeResponse.self, from: data),
               let addressData = response.addresses.first {
                DispatchQueue.main.async {
                    self?.address = self?.formatter.format(addressData) ?? "Invalid address"
                }
            }
        }.resume()
    }
}
