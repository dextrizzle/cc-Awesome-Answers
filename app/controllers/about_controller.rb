class AboutController < ApplicationController
  def index
    #you can do something like this: (assuming about folder is in views folder)
    # render 'about/index'

    #you can also do:
    # render :index
    #the above will assume that `index` template is inside `about` folder
    #because we're inside the `AboutController`

    #if you put nothing, then Rails will default to rendering:
    # app/views/about/index.html.erb because we're inside the AboutController
    # and `index` action (method) in that controller.

    #note convention in naming Rails template
    # ACTION.FORMAT.TEMPLATING_SYSTEM
    # FORMAT: default to `html` unless you specify otherwise
    #         if you go to localhost:3000/about.text then the format will be
    #         `text` (provided view index.text.erb exists)
    # TEMPLATING_SYSTEM: default to ERB unless you install another gem for an
    # =>                 an alternate templating system. available ones include
    # =>                 HAML and SLIM
  end
end
