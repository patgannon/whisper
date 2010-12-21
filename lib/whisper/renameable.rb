
module Whisper::Renameable
  extend ActiveSupport::Concern
  
  module ClassMethods
    def canonical_name(new_name = nil)
      if new_name
        alias_attribute new_name, :name
        @canonical_name = new_name
      end
      @canonical_name ||= :name
    end
  end
end

