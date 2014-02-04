require 'filewatch/tail'
class LogsController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    t = FileWatch::Tail.new
    t.tail("#{Rails.root}/filetowatch")
    t.subscribe do |path, line|
      response.stream.write "data: #{line}\n\n"
    end
  ensure
    response.stream.close
  end
end
