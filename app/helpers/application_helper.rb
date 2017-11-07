module ApplicationHelper


  def link_association_image(obj, f)
    if obj.pictures.count > 0 && (f.index != 'new_pictures')
      image_tag obj.pictures[f.index.to_i].name.url, width: 30
    end
  end

end
