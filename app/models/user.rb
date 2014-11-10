class User < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A\S+@\w+\.\w+\z/, message: "Invalid Email Format" }, uniqueness: true
    validates :acl, presence: true
    
    # Bcrypt requirement
    has_secure_password

    # Timezone Association
    has_many :timezones

    accepts_nested_attributes_for :timezones, allow_destroy: true, reject_if: lambda {|attributes| attributes['region'].blank?}
end
