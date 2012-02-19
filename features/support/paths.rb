module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the login page/
      '/users/sign_in'
    when /the signup page/
      '/users/sign_up'
    when /the edit profile page/
      '/users/edit'
    when /the new project page/
      '/projects/new'
    when /the edit "(.*)" project page/
    puts "#{$1}"
      "/projects/#{Project.find_by_name("#{$1}").id}/edit"

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)

