# Register and configure remote identifiers for persisted objects
Hydra::RemoteIdentifier.configure do |config|
  doi_credentials = Psych.load_file(Rails.root.join("config/doi.yml"))
  config.remote_service(:doi, doi_credentials) do |doi|
    doi.register() do |map|
      map.target :permanent_uri
      map.creator :creator
      map.title :title
      map.publisher :publisher
      map.publicationyear :publication_year
      # Make sure that this method both sets the identifier and persists the change!
      map.set_identifier :set_doi_identifier
    end
  end

  # doi_credentials = Psych.load_file("/path/to/doi_credentials.yml")
  # config.remote_service(:doi, doi_credentials) do |doi|
  #   doi.register(PersistedObject) do |map|
  #     map.target :url
  #     map.creator {|obj| obj.person_name }
  #     map.title :title
  #     map.publisher :publisher
  #     map.publicationyear :publicationyear
  #
  #     # Make sure that this method persists the value
  #     map.set_identifier :set_doi_identifier=
  #   end
  # end
end
