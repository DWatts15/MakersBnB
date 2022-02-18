feature 'viewing an individual property listing' do
  scenario 'a user clicks a link to view a property' do
    setup_test_database
    visit('/signup')

    page.fill_in 'username', with: 'Test username'
    page.fill_in 'password', with: 'Test password'

    click_button('submit')

    connection = PG.connect(dbname: 'login')
    connection.exec("INSERT INTO login_details (username, password) VALUES ('test username', 'test password');")

    page.fill_in 'username_login', with: 'test username'
    page.fill_in 'password_login', with: 'test password'

    click_button('submit_login')

    property = Property.create(name: "Property1", price: "£50", availability: "Available", description: "Good location", username: "Dummy_user")
    Property.create(name: "Property2", price: "£40", availability: "Available", description: "Bad location", username: "Dummy_user")
    Property.create(name: "Property3", price: "£60", availability: "Unavailable", description: "Swimming Pool", username: "Dummy_user")
    Property.create(name: "Property4", price: "£70", availability: "Available", description: "Rooftop bar", username: "Dummy_user")

    visit('/properties')
    
    var = "#" + "#{property.id}"
    expect(page).to have_selector(var)

    find(var).click

    expect(page).to have_content('Property1')
    expect(page).to have_content('£50')
    # expect(page).to have_content('AVAILABILITY?')
    expect(page).to have_content('Good location')
  end
end