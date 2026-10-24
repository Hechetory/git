# Liquid 4.0.3 (pinned by GitHub Pages) still calls Object#tainted?,
# which was removed in Ruby 3.2. Restore the no-op behavior on newer Ruby.
unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end
  end
end
