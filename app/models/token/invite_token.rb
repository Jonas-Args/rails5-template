class Token::InviteToken < Token::Token
    default_scope { where(type: 'Token::InviteToken') }
end
