Paperclip.interpolates('project_id') do |attachment, style|
  instance = attachment.instance
  if instance.is_a? Image
    instance.gallery.project.id
  elsif instance.is_a? Project
    instance.id
  else
    raise "I don't know what I am!"
  end
end

