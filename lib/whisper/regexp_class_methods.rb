module RegexpClassMethods
  def like(str)
    Regexp.new("^#{str}$", "i")
  end
end

Regexp.extend RegexpClassMethods
