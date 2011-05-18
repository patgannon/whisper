module Whisper
  module Sortable
    extend ActiveSupport::Concern
    
    included do
      field :position, :type => Integer
      default_scope order_by([[:position, :asc]])
    end
    
    module ClassMethods
      def sort(ids)
        ids.each_with_index do |x, i|
          o = find(x)
          o.update_attributes(:position => i)
        end
      end
    end
  end
end
