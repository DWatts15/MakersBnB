feature 'Viewing spaces' do
  scenario 'a user can see name, price, availability and description' do
    visit('/availability')

    expect(page).to have_content("Property1")
    expect(page).to have_content("Property2")
  end
end