class User < ApplicationRecord

  VALID_PHONE_REGEX = /1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\d{8}/

  has_many :appraisals
  has_many :orders

  validates :phone, presence: true, uniqueness: true, format: {with: VALID_PHONE_REGEX}

  has_secure_password

  has_secure_token

  after_create :generate_token

  def generate_token
    self.token
    self.regenerate_token
    self.get_phone_address
  end

  def get_phone_address
    begin
      key = '64f15892817c3f3019b05a31672f1e72'
      curl = Curl::Easy.new
      curl.url = "http://apis.juhe.cn/mobile/get?phone=#{self.phone}&key=#{key}"
      curl.http_get
      curl.body
      result = JSON.parse(curl.body)
      if result['resultcode'] == '200'
        res = result['result']
        address = "#{res['province'] || ''} #{res['city'] || ''} #{res['company'] || ''}"
        self.update(phone_address: address)
      end
    rescue Exception => e
      return e
    end
  end

  def sex
    case gender
      when 1 then '男'
      when 2 then '女'
      else
        '未知'
    end
  end

end
