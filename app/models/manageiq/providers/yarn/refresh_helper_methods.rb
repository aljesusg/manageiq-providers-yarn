module ManageIQ::Providers::Yarn::RefreshHelperMethods
  extend ActiveSupport::Concern

  def process_collection(collection, key, store_in_data = true)
    @data[key] ||= [] if store_in_data

    collection.each do |item|
      uid, new_result = yield(item)
      next if uid.nil?

      @data[key] << new_result if store_in_data
      @data_index.store_path(key, uid, new_result)
    end
  end

  module ClassMethods
    def ems_inv_to_hashes(ems, options = nil)
      new(ems, options).ems_inv_to_hashes
    end
  end
end
