module JavaScriptHelper
  def wait_for_turbolinks
    Timeout.timeout(Capybara.default_max_wait_time) do
      active = page.evaluate_script('document.turbolinks:load')
      active = page.evaluate_script('document.turbolinks:load') until active.zero?
    end
  end
end
