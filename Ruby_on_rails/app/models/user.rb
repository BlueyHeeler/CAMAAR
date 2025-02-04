class User < ApplicationRecord
    has_secure_password
    validates :role, inclusion: { in: ['admin', 'student'] }

     # Add timestamps
     before_save :update_timestamp
    
     # Role management methods
     def admin?
         role == 'admin'
     end
     
     def student?
         role == 'student'
     end
     
     def update_role(new_role)
         if ['admin', 'student'].include?(new_role)
             update(role: new_role)
         else
             errors.add(:role, "must be either 'admin' or 'student'")
             false
         end
     end
     
     private
     
     def update_timestamp
         self.updated_at = Time.current
     end
end