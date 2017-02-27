Vmdb::Gettext::Domains.add_domain(
  'ManageIQ_Providers_Yarn',
  ManageIQ::Providers::Yarn::Engine.root.join('locale').to_s,
  :po
)
