#!/usr/bin/env ruby

require 'qiniu'

class QiNiu

  AK = '4OLGRWVmU2Bz1kBZWUAQyu2nYq1xkV1pjtUau1zJ'
  SK = '3ogVf0WByVvPEc6xwAOAcFyfZjnwl149q9RKFov0'
  BUCKET = 'dingle'

  def self.uploaderImage(file_name, file)

    # 构建鉴权对象
    Qiniu.establish_connection! access_key: AK,
                                secret_key: SK

    # 要上传的空间
    bucket = BUCKET
    # 上传到七牛后保存的文件名
    key = file_name

# 构建上传策略，上传策略的更多参数请参照 http://developer.qiniu.com/article/developer/security/put-policy.html
    put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
        3600    # token 过期时间，默认为 3600 秒，即 1 小时
    )

    # 生成上传 Token
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)

    # 要上传文件的本地路径
    filePath = file.path

    # 调用 upload_with_token_2 方法上传
    code, result, response_headers = Qiniu::Storage.upload_with_token_2(
        uptoken,
        filePath,
        key,
        nil, # 可以接受一个 Hash 作为自定义变量，请参照 http://developer.qiniu.com/article/kodo/kodo-developer/up/vars.html#xvar
        bucket: bucket
    )

    if code == 200
      #删除资源
      code, result, response_headers = Qiniu::Storage.delete(bucket, key)
    end

    return "http://o75euthq.bkt.clouddn.com/#{key}?v=#{Time.now.to_i}"

  end
end

