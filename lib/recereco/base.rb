module Recereco
  class Base

    # Define getters and existence checkers
    #
    # @param attrs [Array, Set, Symbol]
    def self.attr_reader(*attrs)
      mod = Module.new do
        attrs.each do |attribute|
          define_method attribute do
            @attrs[attribute.to_sym]
          end
          define_method :"#{attribute}?" do
           !!@attrs[attribute.to_sym]
          end
        end
      end
      const_set(:Attributes, mod) unless defined? Attributes
      include mod
    end

    # Returns a new object based on the response hash
    #
    # @param response [Hash]
    # @return [Zaim::Base]
    def self.from_response(response={})
      new(response[:body])
    end

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @return [Zaim::Base]
    def initialize(attrs={})
      @attrs = attrs
      self
    end

    # Fetches an attribute of an object using hash notation
    #
    # @param method [String, Symbol] Message to send to the object
    def [](method)
      send(method.to_sym)
    rescue NoMethodError
      nil
    end

    # Retrieve the attributes of an object
    #
    # @return [Hash]
    def attrs
      @attrs
    end
    alias to_hash attrs

    # Update the attributes of an object
    #
    # @param attrs [Hash]
    # @return [Zaim::Base]
    def update(attrs)
      @attrs.update(attrs)
      self
    end

  protected

    # @param attr [Symbol]
    # @param other [Zaim::Base]
    # @return [Boolean]
    def attr_equal(attr, other)
      self.class == other.class && !other.send(attr).nil? && send(attr) == other.send(attr)
    end

    # @param other [Zaim::Base]
    # @return [Boolean]
    def attrs_equal(other)
      self.class == other.class && !other.attrs.empty? && attrs == other.attrs
    end

  end
end
