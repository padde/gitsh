require 'singleton'

module Gitsh
  class TermInfo
    include Singleton

    def color_support?
      tput('colors').to_i > 0
    end

    private

    def tput(property)
      output, error, exit_status = Open3.capture3("tput #{property}")
      if exit_status.success?
        output.chomp
      end
    end
  end
end
