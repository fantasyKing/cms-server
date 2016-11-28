class AppAppInfo
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  store_in Phoncol::AppAppInfo.store

  field :app_id, type: String
  field :app_name, type: String
  field :user_verify_push_by_bot_id, type: String
  field :user_verify_push_success_content, type: String
  field :alipay_config_id, type: String
  field :channel_id, type: String
  field :website, type: String
  field :h5_site, type: String
  field :ios_market, type: String, default: 'https://appsto.re/cn/KhKj8.i'
  field :android_market, type: String, default: 'http://fir.im/sudoboot'
  field :ios_extend, type: String
  field :android_extend, type: String
  field :rate, type: Array
  field :ios_version, type: String
  field :ios_version_min, type: String
  field :android_version, type: String
  field :android_version_min, type: String
  field :apk_download_url, type: String
  field :is_empty_valid, type: Boolean
  field :pre_update_version, type: String
  field :pre_update_url, type: String
  field :wcpay_config_id, type: String
  field :extra, type: Hash
  field :notification_room, type: Array
  field :default_join_channel_ids, type: Array
  field :win_version, type: String
  field :win_url, type: String
  field :mac_version, type: String
  field :mac_url, type: String

  def self.valid_attrs
    example = self.first
    if example.nil?
      res = AppAppInfo.fields.keys
    else
      res = (AppAppInfo.fields.keys + example.attributes.keys).delete_if{|i| i.in? ["_id","hello","created_at","updated_at","__v"]}
    end
    res.map {|i| i.to_sym}
  end
end
