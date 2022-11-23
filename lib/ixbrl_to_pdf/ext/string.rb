# frozen_string_literal: true

class String
  def ext(newext = '')
    return dup if ['.', '..'].include? self

    newext = ".#{newext}" if newext != '' && newext !~ /^\./
    chomp(File.extname(self)) << newext
  end
end
