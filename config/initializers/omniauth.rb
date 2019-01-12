Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '331946634293685', 'b886974b1b3a0cc62ce42f2c3df54ab3',
    display: 'popup'
    #OmniAuth.config.logger = Rails.logger
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end