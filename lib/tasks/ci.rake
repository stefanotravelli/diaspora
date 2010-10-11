desc "Run all specs and features"
task :ci => [:environment] do
  system "/etc/init.d/xvfb start"
  system "DISPLAY=:99.0 bundle exec rake"
  exit_status = $?.exitstatus
  system "/etc/init.d/xvfb stop"
  raise "tests failed!" unless exit_status == 0
end