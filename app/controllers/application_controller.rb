class ApplicationController < ActionController::Base
  protect_from_forgery

  def cache_page(content = nil, options = nil)
    path = "/#{request.host}"
    path << case options
    when Hash
      url_for(options.merge(:only_path => true, :skip_relative_url_root => true, :format => params[:format]))
    when String
      options
    else
      if request.path.empty? || request.path == '/'
        '/index'
      else
        request.path
      end
    end
    super(content, path)
  end
end
