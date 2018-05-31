class Token::ForgotToken < Token::Token
  default_scope { where(type: 'Token::ForgotToken') }

end
