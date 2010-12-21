module Whisper
  module StringExt
    def true?
      downcase == "true"
    end
  end
end

String.send :include, Whisper::StringExt
