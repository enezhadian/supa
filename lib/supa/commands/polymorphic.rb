require 'supa/command'

module Supa
  module Commands
    class Polymorphic < Supa::Command
      def represent
        tree[name] ||= []

        Array(get_value).each do |element|
          tree[name] << {}

          Supa::Builder.new(context: element, tree: tree[name][-1]).instance_exec(&block)
        end
      end
    end
  end
end
