class Person < ApplicationRecord
  belongs_to :role, optional: true
end
