if exists("g:loaded_vimux_cucumber_test") || &cp
  finish
endif
let g:loaded_vimux_cucumber_test = 1

if !has("ruby")
  finish
end

command RunAllCukes :call s:RunAllCukes()
command RunFocusedCuke :call s:RunFocusedCuke()

function s:RunAllCukes()
  ruby Cucumber.new.run_all
endfunction

function s:RunFocusedCuke()
  ruby Cucumber.new.run_scenario
endfunction

ruby << EOF
module VIM
  class Buffer
    def method_missing(method, *args, &block)
      VIM.command "#{method} #{self.name}"
    end
  end
end

class Cucumber
  def current_file
    VIM::Buffer.current.name
  end

  def line_number
    VIM::Buffer.current.line_number
  end

  def run_scenario
    send_to_vimux("#{feature_command} '#{current_file}' -l #{line_number}")
  end

  def run_all
    send_to_vimux("#{feature_command} '#{current_file}'")
  end

  def feature_command
    if File.exists?("Gemfile") && `bundle show cucumber`.match(/cucumber/)
      "bundle exec cucumber"
    else
      "cucumber"
    end
  end

  def send_to_vimux(test_command)
    Vim.command("call RunVimTmuxCommand(\"clear && #{test_command}\")")
  end
end
EOF
