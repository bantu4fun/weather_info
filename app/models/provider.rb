class Provider < ActiveRecord::Base

  REGEX = /\A[A-Z][a-z]+([A-Z][a-z]+)+\z/

  validates :name, presence: true
  validates :url, presence: true
  validates :operation, presence: true,
            format: { with: REGEX, message: "only CamelCase strings." }
            
end
