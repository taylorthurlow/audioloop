require 'rails_helper'

describe 'User signs in', type: :system do
  let(:user) { create(:user) }

  it 'using the login form' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret'
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'
  end
end
