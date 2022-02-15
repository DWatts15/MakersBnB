feature 'Adding a new property' do
  scenario 'A user can add a property to MakersBnB' do
    visit('/properties/new')
    fill_in('name', with: 'New_Property')
    click_button('Submit')

    expect(page).to have_content 'New_Property'
  end
end