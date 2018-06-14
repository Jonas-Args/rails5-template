class Tokens::AccessToken < Token
  default_scope { where(type: 'Tokens::AccessToken') }
end
