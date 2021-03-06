# MakersBnB Challenge - Makers Week 7

Team: Shalini, Fred, Abdul, Dan

# Spec:
## "Headline specifications"

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

## "Nice-to-haves"

- Users should receive an email whenever one of the following happens:
  - They sign up
  - They create a space
  - They update a space
- A user requests to book their space
- They confirm a request
- They request to book a space
- Their request to book a space is confirmed
- Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
  - A user requests to book their space
  - Their request to book a space is confirmed
  - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

# User Stories
- Spec: Any signed-up user can list a new space.

As a host (amend if necessary),
In order to list a space,
I need to sign up to MakersBnB

As a host,
So I can list a new space,
I want to add a space to MakersBnB

- Spec: Users can list multiple spaces.

As a host,
In order to list multiple spaces,
I want to add my space to a list of spaces on MakersBnB

- Spec: Users should be able to name their space, provide a short description of the space, and a price per night.

As a host,
In order to put information about my space on MakersBnB,
I need to provide a name, short description and price per night.

- Spec: Users should be able to offer a range of dates where their space is available.

As a host,
In order to give availability,
I want to be able to show a range of dates where my space is available

- Spec: Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

As a customer,
In order to reserve a space,
I want request the space on an available day

As a host,
In order to confirm a reservation,
I want to be able to approve a booking

- Spec: Nights for which a space has already been booked should not be available for users to book that space.

As a host,
In order to avoid double-booking,
I want to hide spaces that are already booked.

- Spec: Until a user has confirmed a booking request, that space can still be booked for that night.

As a host,
So that I can choose my customers,
I want the space to show as available until the booking has been confirmed

# Planning Phase (working notes)
## User flow

1. Register for MakersBnB/Login 
2. Go to Properties page
3. Create new Property (logged in? true -> Pull username/password + make new Property, false -> back to Login page)

Shalini + Dan:
- Add username to table
- Update code to include username 
- Update index to include username
- Add an image url to /index and individual property page (placeholder images website)

Fred + Abdul:
- Implement sessions
- Redirect new property (not logged in) back to login page


Abdul + Dan:
- Hyperlink each property on listings (index)
- Clicking the hyperlink will pass property id to variable (listing_page_property_id) in app.rb
- On individual property page, pull that listing_page_property_id and use this to display the correct property details

- User controls will also be pulled at the same time
- Change 'availability' parameter from string to array on the erb file