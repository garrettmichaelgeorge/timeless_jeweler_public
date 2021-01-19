Rails.autoloaders.each do |autoloader|
  autoloader.inflector.inflect(
    'sti_preload' => 'STIPreloader'
  )
end
