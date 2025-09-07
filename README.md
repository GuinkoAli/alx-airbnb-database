# alx-airbnb-database
## Database Design
* **Users**
  - id, name, email, password
  - A user can own properties, make bookings, leave reviews, and make payments.
* **Properties**
  - id, user_id, title, description, price, location
  - A user can own many properties that other users can reiew and book.
* **Bookings**
  - id, user_id, property_id, start_date, end_date, status
  - A user can book a property that is connected to another user with only one payment.
- **Payments**
  - id, booking_id, amount, method, status
  - A payment is linked to one booking.
* **Reviews**
  - id, user_id, property_id, rating, comment
  - A review is attached to a particular user and a property.