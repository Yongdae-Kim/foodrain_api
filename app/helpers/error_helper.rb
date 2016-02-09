require 'json'

module ErrorHelper
  def self.error_handling(message, discription)
    error_hash = {
      message: message,
      discription: discription
    }
    @error = JSON.generate(error_hash)
  end

  def self.auth_faild_error
    error_handling('사용자 인증 실패','존재하지 않는 사용자입니다.')    
  end
end
