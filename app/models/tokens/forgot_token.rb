class Tokens::ForgotToken < Token
  default_scope { where(type: 'Tokens::ForgotToken') }

end
