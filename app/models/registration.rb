class Registration < ApplicationRecord
  validates_presence_of :rider, :first_name, :last_name,
                        :residential_address, :email, :contact_number,
                        :motorcycle, :shirt_size, :payment_method

  validates_inclusion_of :shirt_size, in: %w(Small Medium Large X-Large 2X-Large 3X-Large 4X-Large)
  validates_inclusion_of :payment_method, in: ['EFT (Electronic Fund Transfer)', 'Cash Deposit']
  validates_acceptance_of :terms_and_conditions
  validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/

  after_create :generate_reference
  def generate_reference
    update reference: "#{'%03d' % (id % 1000)}#{first_name.upcase[0..2]}", year: 2019
  end
end
