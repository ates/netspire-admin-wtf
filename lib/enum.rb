class Enum
    class << self
        def option(name, value)
            raise ArgumentError if options.has_value?(value)
            options[name] = value
        end

        def const_missing(key)
            options[key]
        end

        def values
            options.values
        end

        def options
            @options ||= ActiveSupport::OrderedHash.new
        end

        def from_value(value)
            new(value)
            rescue
                nil
            end
        end

        attr_reader :value

        def initialize(value)
            raise ArgumentError, "invalid enum value" unless self.class.values.include?(value)
            @key, @value = self.class.options.select { |k, v| v == value }.first
        end

        def to_s
            scope = self.class.name.underscore.split("/").join(".")
            I18n.t(@key.to_s.underscore, :scope => [:enums, scope], :default => @key.to_s)
        end

        def ==(obj)
            case obj
            when Fixnum, String
                @value == obj
            when Enum
                @value == obj.value
            else
                false
            end
        end
end
