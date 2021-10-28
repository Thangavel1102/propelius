class User < ApplicationRecord
	has_secure_password

	enum role: [:inventory_manager, :quality_check_person, :sales_manager, :it_admin]
end
