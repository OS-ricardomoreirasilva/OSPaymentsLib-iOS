/// Model to manage Stripe's payment process request parameters. This is based on `OSPMTRequestParametersModel`.
final class OSPMTStripeRequestParametersModel: OSPMTRequestParametersModel {
    let paymentMethodId: String
    let confirm: Bool
    
    /// Keys used to encode and decode the model.
    enum CodingKeys: String, CodingKey {
        case paymentMethodId = "payment_method"
        case confirm
    }
    
    /// Constructor method.
    /// - Parameters:
    ///   - amount: Amount to charge.
    ///   - currency: Currency to charge.
    ///   - paymentMethodId: Stripe object that represents the customer's payment instruments.
    ///   - confirm: Automatically confirm the triggered payment process.
    init(amount: Int, currency: String, paymentMethodId: String, confirm: Bool = true) {
        self.paymentMethodId = paymentMethodId
        self.confirm = confirm
        super.init(amount: amount, currency: currency)
    }
    
    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(paymentMethodId, forKey: .paymentMethodId)
        try container.encode(confirm, forKey: .confirm)
        try super.encode(to: encoder)
    }
}
