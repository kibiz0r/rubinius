namespace :lib do
  desc "Build shared library"
  task :shared => ["build:build", "gems:install"] do
    blueprint = Daedalus.load "rakelib/blueprint.rb"
    blueprint.build "vm/#{Rubinius::BUILD_CONFIG[:shared_lib_name]}"
    ln_sf "../vm/#{Rubinius::BUILD_CONFIG[:shared_lib_name]}", "lib/#{Rubinius::BUILD_CONFIG[:shared_lib_name]}"
  end
  
  desc "Build static library"
  task :static => ["build:build", "gems:install"] do
    blueprint = Daedalus.load "rakelib/blueprint.rb"
    blueprint.build "vm/#{Rubinius::BUILD_CONFIG[:static_lib_name]}"
    ln_sf "../vm/#{Rubinius::BUILD_CONFIG[:static_lib_name]}", "lib/#{Rubinius::BUILD_CONFIG[:static_lib_name]}"
  end

  namespace :only do
    desc "Only build shared library"
    task :shared do
      blueprint = Daedalus.load "rakelib/blueprint.rb"
      blueprint.build "vm/#{Rubinius::BUILD_CONFIG[:shared_lib_name]}"
      ln_sf "../vm/#{Rubinius::BUILD_CONFIG[:shared_lib_name]}", "lib/#{Rubinius::BUILD_CONFIG[:shared_lib_name]}"
    end
    
    desc "Only build static library"
    task :static do
      blueprint = Daedalus.load "rakelib/blueprint.rb"
      blueprint.build "vm/#{Rubinius::BUILD_CONFIG[:static_lib_name]}"
      ln_sf "../vm/#{Rubinius::BUILD_CONFIG[:static_lib_name]}", "lib/#{Rubinius::BUILD_CONFIG[:static_lib_name]}"
    end
  end    
end
