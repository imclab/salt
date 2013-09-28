module Salt
  module Frontable
    def read_with_yaml(path)
      contents = File.read(path)
        
      if parts = contents.match(/^(-{3}\n.*?\n?)^(-{3}*$\n?)/m)
        metadata = YAML::load(parts[1])
        contents = parts.post_match.strip!
      else
        metadata = {}
      end

      [contents, metadata]
    end
  end
end