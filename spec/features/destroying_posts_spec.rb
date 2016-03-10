# click on the 'Delete Post' button
# expect to be routed to the root again.
# expect to see the message "Problem solved!  Post deleted."
# expect to not see the old post anymore.

require 'rails_helper.rb'

feature 'Remove individual post' do
    background do
      posts = create(:post, caption: 'Abs for days.')
  
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      click_link 'Edit Post'
  end
  
   scenario 'Can remove a post' do
        click_link 'Delete Post'
        expect(page).to have_content("Problem solved!  Post deleted.")
        expect(page).to_not have_content("Abs for days.'")
    end
end