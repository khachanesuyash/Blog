class Post < ApplicationRecord
    belongs_to :category

    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    # File Uploads
    has_one_attached :featured_image

    # Rich action text
    has_rich_text :description

    def all_tags= (names)
        if names.blank?
            return
        end
        self.tags = names.split(",").map() do |name|
            unless name.blank?
                Tag.where(name: name.strip).first_or_create!
            end
        end
    end

    def all_tags
        tags.map(&:name).join(", ")
    end
end
