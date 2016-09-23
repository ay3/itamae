%w( mysql mysql-server mysql-devel ).each do |pkg|
  package pkg
end

# my.cnfの設定
execute 'my.cnf settings' do
  command <<-EOL
    cp /etc/my.cnf /etc/my.cnf.org
  EOL
end

# mysql起動
service 'mysqld' do
  action [:enable, :start]
end

# MySQL初期設定
execute "mysql_secure_installation" do
  user "root"
  only_if "mysql -u root -e 'show databases' | grep information_schema" # パスワードが空の場合
  command <<-EOL
    #mysqladmin -u root password ""
    #mysql -u root -ppassword -e "DELETE FROM mysql.user WHERE User='';"
    #mysql -u root -ppassword -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');"
    #mysql -u root -ppassword -e "DROP DATABASE test;"
    #mysql -u root -ppassword -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
    #mysql -u root -ppassword -e "FLUSH PRIVILEGES;"
  EOL
end

