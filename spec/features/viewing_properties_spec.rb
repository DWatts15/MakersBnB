feature 'Viewing spaces' do
  scenario 'a user can see name, price, availability and description' do
    add_row_to_test_database
    
    visit('/availability')

    expect(page).to have_content("Property1")
    expect(page).to have_content("Property2")
    expect(page).to have_content("Property3")
    expect(page).to have_content("Property4")
  end
end