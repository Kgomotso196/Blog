# The `ApplicationRecord` serves as the base class for all models
# in the application. It extends `ActiveRecord::Base` and is used
# to define common configurations or behaviors for models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
