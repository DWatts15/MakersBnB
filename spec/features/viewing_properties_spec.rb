feature 'Viewing spaces' do
  scenario 'a user can see name, price, availability and description' do
    visit('/availability')

    expect(page).to have_content("Property1 - £50 - Available - Good Location")
    expect(page).to have_content("Property2 - £60 - Available - Bad Location")
  end
end