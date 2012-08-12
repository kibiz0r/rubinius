namespace :lib do
  namespace :only do
    desc "Only build shared library"
    task :shared do
      blueprint = Daedalus.load "rakelib/blueprint.rb"
      blueprint.build "#{Rubinius::BUILD_CONFIG[:prefixdir]}#{Rubinius::BUILD_CONFIG[:bindir]}/#{Rubinius::BUILD_CONFIG[:shared_lib_name]}"
    end
    
    desc "Only build static library"
    task :static do
      blueprint = Daedalus.load "rakelib/blueprint.rb"
      blueprint.build "#{Rubinius::BUILD_CONFIG[:prefixdir]}#{Rubinius::BUILD_CONFIG[:bindir]}/#{Rubinius::BUILD_CONFIG[:static_lib_name]}"
    end
  end    

  desc "Build shared library"
  task :shared => ["build:build", "gems:install", "lib:only:shared"]
  
  desc "Build static library"
  task :static => ["build:build", "gems:install", "lib:only:static"]
end
