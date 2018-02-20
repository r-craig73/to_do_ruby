require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to input a new list') do
    visit('/')
    fill_in('list', :with =>'Epicodus Work')
    click_button('Add list!')
    expect(page).to have_content('Here are your lists:')
  end
end

describe('seeing details for a single list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    test_list = List.new({:name => 'School stuff', :id => nil})
    test_list.save()
    test_task = Task.new({:description => "learn SQL", :list_id => test_list.id(), :due_date => "2018-02-28 00:00:00"})
    test_task.save()
    visit('/')
    click_link(test_list.name())
    expect(page).to have_content(test_task.description())
  end
end
