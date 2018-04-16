require 'pry'

feature 'Delete existing bookmarks' do
  scenario 'A user can press button Delete and choose form check-boxes
  which bookmarks user whants to delete' do
    create_database_with_several_bookmarks_for_feature_test
    click_button('Select')
    check(1)
    click_button('Delete')
    # save_and_open_page
    expect(page.has_no_link?(1)).to be(true)
  end
end
