ssh_config_path = File.expand_path('../../../.ssh/config')
config_arr = File.read(ssh_config_path).lines # We read config content and split it by line

aliases =
  config_arr
    .grep(/^Host/) # we need only lines with host names
    .map do |line|
      line.sub(/^Host/, '').strip # remove Host str and unnecessary white characters
    end.sort # and sort result, because why not?