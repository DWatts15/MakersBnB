require 'pg'
require_relative '../../app'

feature 'Sign up' do

  scenario 'Username and password are added to database' do
    visit('/signup')

    page.fill_in 'username', with: 'Test username'
    page.fill_in 'password', with: 'Test password'

    click_button('submit')

    connection = PG.connect(dbname: 'login')
    connection.exec("INSERT INTO login_details (username, password) VALUES ('test username', 'test password');")

    result = connection.exec('SELECT * FROM login_details;')

    expect(result[0]).to have_content 'test username'
  end


  
  scenario 'User can login' do
    visit('/signup')

    page.fill_in 'username_login', with: 'test username'
    page.fill_in 'password_login', with: 'test password'

    click_button('submit_login')

    connection = PG.connect(dbname: 'login')
    result = connection.exec('SELECT username, password FROM login_details;')

    expect(@username_sign_in).to eq (result[0]["username"])
    expect("test password").to eq (result[0]["password"])
  end






end