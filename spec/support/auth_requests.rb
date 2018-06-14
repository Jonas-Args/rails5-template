#
# Authenticated requests
#
[:get, :patch, :put, :post, :delete].each do |method|

  define_method "auth_#{method}" do |path, *args|
    params = args[0] || {}
    headers = args[1] || {}
    if args[2].present?
      user = args[2]
      user.set_access_token
    else
      user = current_user
    end
    send(method, path, params: params, headers: headers.merge({AccessToken: user.current_token}))
  end

  define_method "driver_auth_#{method}" do |path, *args|
    params = args[0] || {}
    headers = args[1] || {}
    if args[2].present?
      user = args[2]
      user.set_access_token
    else
      user = current_driver
    end
    send(method, path, params: params, headers: headers.merge(AccessToken: user.current_token))
  end

end
