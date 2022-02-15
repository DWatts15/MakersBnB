feature 'Adding a new property' do
  scenario 'A user can add a property to MakersBnB' do
    visit('/properties/new')
    fill_in('name', with: 'New_Property')
    fill_in('price', with: '£50')
    fill_in('availability', with: 'Available')
    fill_in('description', with: 'Good location')
    click_button('Submit')

    expect(page).to have_content 'New_Property'
    expect(page).to have_content '£50'
    expect(page).to have_content 'Available'
    expect(page).to have_content 'Good location'
  end
end