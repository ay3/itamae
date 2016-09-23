group "rails" do
  gid 501
  action :create
end

user "rails" do
  home "/home/rails"
  shell "/bin/bash"
  uid 501
  gid "taro"
  create_home true
  action :create
end

