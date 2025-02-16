class User < ApplicationRecord
    has_many :registro_matricula, dependent: :destroy, class_name: "Matricula", foreign_key: "user_id"
    has_one :coordenador, dependent: :destroy, class_name: "Coordenador", foreign_key: "user_id"
    has_many :questionarios, dependent: :destroy
    has_many :resposta, dependent: :destroy
    has_one_attached :avatar, dependent: :destroy
    has_secure_password

    validates :password, presence: true, on: :create
    validates :role, inclusion: { in: [ "admin", "professor", "student" ] }

    before_save :update_timestamp

    def admin?
        role == "admin"
    end

    def student?
        role == "student"
    end

    def professor?
        role == "professor"
    end

    def update_role(new_role)
        if [ "admin", "professor", "student" ].include?(new_role)
            update(role: new_role)
        else
            errors.add(:role, "must be admin, professor, or student")
            false
        end
    end

    private

    def update_timestamp
        self.updated_at = Time.current
    end
end
