# HUBLOT Project Analysis
Application for connecting service providers and customers. The general idea of the project is to design software program connecting service providers and customers

## Project strengths
- Database of Qualified Service Providers
- User-friendly and Intuitive Interface
- Advanced Search and Filtering Features by Geolocation
- Rating and Review System to Ensure the Quality of Service Providers
## Project weekness
- Need for a strong marketing strategy
- Dependence on service providers to keep profiles up to date
- Risk of competition with already established similar applications
## Opportunities
- Strong demand for services
- Possibility of expansion into other regions or countries
- Potential for partnerships with local businesses to offer complementary services
- Strong user community
## Threads
- Fierce competition in the matchmaking application sector
- Risk of poor reputation due to unreliable service providers
- Rapid evolution of user preferences and behaviors
## Use cases
- Browse through different services (filter)
- Manage (create, modify, view, delete) a service
- Rate an offer
- Subscribe to the visibility offer
- Manage visibility offers (admin)
- Order a service
  - Choose a service
  - Add preferences (date, time, location, etc.)
  - Confirm an order (provider)
  - Cancel an order (offer not confirmed)
  - Configure payment installments
  - Search for services (proximity, etc.)
  - Pay (after client confirming the offer)
  - follow up service completion
    - change completion state (provider)
    - see level of completion
  - confirm service delivery  
- Get in touch
  - Send a message
  - Receive a message
  - Send a confirmation voucher (WhatsApp)
  - Confirm the offer (WhatsApp)
- Authenticate (WhatsApp)
- Notify the client via WhatsApp (system):
  - Start of service
  - Arrival of the provider
  - End of service
- Report a problem
- Customize offers (system)
- Contact customer service
- Spare part marketplace
  - Browse spare parts (New & Old)
  - Buy spare part
  - Manage  spare part (pathner)
### What's a service
To define the basic properties of a service in an on-demand service application, we will use the following elements:
- **Service Name:** A name of fewer than 75 characters.
- **Service Description:** A clear and detailed description of the offered service, including its features, benefits, and terms of use.
- **Categorization:** Services should be categorized into specific categories or types to facilitate user search and navigation.
- **Pricing:** Service rates, including base costs, any additional fees (spare parts, required work materials, etc.), and accepted payment methods (full payment upfront or after completing a specific stage).
- **Availability:** Service hours and availability, as well as any geographical restrictions (to be specified during provider registration).
## General use case Diagram
![image](https://github.com/Hublot-Tech/docs/assets/61763373/1e0f39df-2ad5-405f-823d-a63247a8e915)
### Order management use case
![image](https://github.com/Hublot-Tech/docs/assets/61763373/96f90648-5271-4a24-83be-7f1cef4de194)
### Store management use case
![image](https://github.com/Hublot-Tech/docs/assets/61763373/7cec86d1-e709-4383-a61b-1b5bb23c1d07)
