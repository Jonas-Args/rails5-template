class Tokens::InviteToken < Token
    default_scope { where(type: 'Tokens::InviteToken') }
end
