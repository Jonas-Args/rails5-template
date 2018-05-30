class Token::AccessToken < Token::Token
  default_scope { where(type: 'Token::AccessToken') }
end
