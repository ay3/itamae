%w( git
sqlite-devel
gcc-c++
readline
readline-devel
zlib
zlib-devel
libyaml-devel
libffi-devel
libxslt-devel
openssl-devel
curl-devel ).each do |pkg|
  package pkg
end
