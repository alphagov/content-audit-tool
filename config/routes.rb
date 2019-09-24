Rails.application.routes.draw do
  root to: "allocations#index"

  resources :content_items, only: %w(index show), param: :content_id do
    get :audit, to: "audits#show"
    post :audit, to: "audits#save"
    patch :audit, to: "audits#save"
  end

  resource :audits

  get "/my-content", to: "audits#index", as: "my_content"
  resource :report, only: :show
  resource :guidance, only: :show

  post :allocations, to: "allocations#destroy", constraints: ->(req) { req.parameters["allocate_to"] == "no_one" }
  resources :allocations, only: %w(index create)

  if Rails.env.development?
    mount GovukAdminTemplate::Engine, at: "/style-guide"
  end

  # rack-proxy does not work with webmock, so disable it for tests: https://github.com/ncr/rack-proxy#warning
  if Rails.env.test?
    get "#{Proxies::IframeAllowingProxy::PROXY_BASE_PATH}*base_path", to: proc { [200, {}, ["Proxy disabled in Test environment"]] }
  else
    mount Proxies::IframeAllowingProxy.new => Proxies::IframeAllowingProxy::PROXY_BASE_PATH
  end
end
