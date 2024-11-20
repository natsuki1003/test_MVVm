// AddressModel.swift

// Represents the response from the postal code API.
// This structure includes the postal code used in the query and a list of matching addresses.
struct JPPostalCodeResponse: Codable {
    let postalCode: String       // The postal code provided in the query.
    let addresses: [Address]     // A list of addresses matching the postal code.
}

// Represents a single address in both English and Japanese formats.
// This structure separates the address data into two different languages.
struct Address: Codable {
    let en: EnglishAddress       // The English representation of the address.
    let ja: JapaneseAddress      // The Japanese representation of the address.
}

// Represents an English-formatted address.
// Includes specific address components such as prefecture, city, and district.
struct EnglishAddress: Codable {
    let prefecture: String       // The prefecture (e.g., "Tokyo").
    let address1: String         // The city or municipality (e.g., "Chiyoda City").
    let address2: String         // The district or neighborhood (e.g., "Marunouchi").
    let address3: String         // Additional details such as building name (often empty).
    let address4: String         // Other optional details (often empty).
}

// Represents a Japanese-formatted address.
// Includes specific address components such as prefecture, city, and district in Japanese.
struct JapaneseAddress: Codable {
    let prefecture: String       // The prefecture in Japanese (e.g., "東京都").
    let address1: String         // The city or municipality in Japanese (e.g., "千代田区").
    let address2: String         // The district or neighborhood in Japanese (e.g., "丸の内").
    let address3: String         // Additional details such as building name (often empty).
    let address4: String         // Other optional details (often empty).
}
