# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)

    case page_name

    when /^the home\s?page$/ then '/'

    when /^the profile page$/ then '/user/profile'

    when /^the details page for "([^"]*)"$/ then "/representatives/#{Representative.find_by(name: $1).id}"

    when /^the news page for "([^"]*)"$/ then "/representatives/#{Representative.find_by(name: $1).id}/news_items"

    when /^the create news page for "([^"]*)"$/ then
      "/representatives/#{Representative.find_by(name: $1).id}/representatives/#{Representative.find_by(name: $1).id}/my_news_item/new"

    when /^the state page for "([^"]*)"$/ then "/state/CA"

    when /^the county page for "([^"]*)"$/ then "state/CA/county/1"

    # when /^the representative\s?page$/ then /representatives

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
  State.find_by(name: "California")

end

World(NavigationHelpers)
