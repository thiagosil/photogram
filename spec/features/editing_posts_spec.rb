require 'rails_helper.rb'

feature 'Display individual post' do
    background do
      posts = create(:post)
  
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      click_link 'Edit Post'
  end
  
    scenario 'Can edit a post' do
        fill_in 'Caption', with: 'Oh god, you weren’t meant to see this picture!'
        click_button 'Update Post'
        expect(page).to have_content("Post updated hombre.")
        expect(page).to have_content("Oh god, you weren’t meant to see this picture")
    end
    
    it 'wont update without an image ' do  
      fill_in 'Caption', with: "No picture because YOLO"
      attach_file('Image', 'spec/files/images/coffee.zip')
      click_button 'Update Post'
      expect(page).to have_content('Something is wrong with your form!')
    end  
end