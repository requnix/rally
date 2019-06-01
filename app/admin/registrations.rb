ActiveAdmin.register Registration do
  config.sort_order = 'created_at_desc'

  index do
    column :id
    column :first_name
    column :last_name
    column :chapter
    column :year
    column :reference
    column(:type) { |r| r.rider ? 'Rider' : 'Pillion' }
    column :paid
    column(:amount) { |r| r.friday_meal ? 965 : 870 }
    column 'Registered', :created_at
    actions
  end

  filter :year
  filter :rider, label: 'Type'
  filter :first_name
  filter :last_name
  filter :email
  filter :reference
  filter :paid
  filter :created_at, label: 'Registered'

  # scope '2019', -> { where year: 2019 }

  form do |f|
    f.inputs name: 'Registration' do
      f.input :year
      f.input :rider, label: 'Type', as: :select, collection: { 'Rider' => true, 'Pillion' => false }, include_blank: false
      f.input :first_name
      f.input :last_name
      f.input :residential_address, input_html: { rows: 4 }
      f.input :postal_address, input_html: { rows: 4 }
      f.input :contact_number
      f.input :alternate_contact_number
      f.input :email
      f.input :motorcycle
      f.input :chapter
      f.input :shirt_size, as: :select, collection: %w(Small Medium Large X-Large 2X-Large 3X-Large 4X-Large), include_blank: false
      f.input :payment_method, as: :select, collection: ['EFT (Electronic Fund Transfer)', 'Cash Deposit'], include_blank: false
      f.input :reference, input_html: { disabled: true }
      f.input :terms_and_conditions, label: 'Accepted terms and conditions'
      f.input :paid
    end
    f.actions
  end

  permit_params :rider, :first_name, :last_name,
                :residential_address, :postal_address,
                :email, :contact_number, :alternate_contact_number,
                :motorcycle, :chapter, :shirt_size,
                :payment_method, :terms_and_conditions,
                :authenticity_token, :year

  # Excel configuration
  config.xls_builder.header_format = { weight: :bold }
  config.xls_builder.delete_columns :id, :created_at, :updated_at
end
