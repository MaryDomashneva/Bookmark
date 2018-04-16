require 'pry'

feature 'Update existing bookmarks' do
  scenario 'A user can press button Update and choose form check-boxes
  which bookmark user whants to update' do
    create_database_with_several_bookmarks_for_feature_test
    click_button('Update')
    check(1)
    click_button('Submit')
    # save_and_open_page
    expect(find_link('Travis_CI').visible?).to be(true)
  end
end
