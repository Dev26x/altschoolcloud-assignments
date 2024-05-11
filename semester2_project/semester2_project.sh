#!/bin/bash

# Variables
PROJECT_NAME="laravel"
PROJECT_DIRECTORY="/var/www/$PROJECT_NAME"
MYSQL_DB="Project"
MYSQL_USER="Hakeem"
MYSQL_PASSWORD="vagrant"

# Function to update repository and install required packages
install_required() {
    sudo apt update -y
    sudo apt install apache2 -y
    sudo add-apt-repository ppa:ondrej/php -y
    sudo apt update -y
    sudo apt install php8.2 php8.2-curl php8.2-dom php8.2-mbstring php8.2-xml php8.2-mysql zip unzip git -y
    sudo a2enmod rewrite
}

# Function to install Composer
install_composer() {
    cd /usr/local/bin
    sudo curl -sS https://getcomposer.org/installer | sudo php -q
    sudo mv composer.phar composer
}

# Function to clone Laravel repo and change ownership
clone_repo() {
    cd /var/www/
    sudo git clone https://github.com/laravel/laravel.git $PROJECT_NAME
    sudo chown -R $USER:$USER $PROJECT_DIRECTORY
}

# Function to install Composer dependencies
composer_dependencies() {
    cd $PROJECT_DIRECTORY
    composer install --no-interaction --optimize-autoloader --no-dev
    composer update --no-interaction
}

# Function to create .env file
create_env() {
    sudo cp $PROJECT_DIRECTORY/.env.example $PROJECT_DIRECTORY/.env
    sudo chown -R www-data $PROJECT_DIRECTORY/storage
    sudo chown -R www-data $PROJECT_DIRECTORY/bootstrap/cache
}

# Function to configure Apache
configure_apache() {
    sudo tee /etc/apache2/sites-available/$PROJECT_NAME.conf > /dev/null <<EOF
<VirtualHost *:80>
    ServerName localhost
    DocumentRoot $PROJECT_DIRECTORY/public

    <Directory $PROJECT_DIRECTORY>
        AllowOverride All
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/$PROJECT_NAME-error.log
    CustomLog \${APACHE_LOG_DIR}/$PROJECT_NAME-access.log combined
</VirtualHost>
EOF

    sudo a2ensite $PROJECT_NAME.conf
    sudo a2dissite 000-default.conf
}

# Function to install and configure MySQL
install_configure_mysql() {
    sudo apt install mysql-server mysql-client -y
    sudo systemctl start mysql
    sudo mysql -uroot -e "CREATE DATABASE $MYSQL_DB;"
    sudo mysql -uroot -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
    sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'localhost';"
}

# Function to modify .env file
modify_env() { 
    sudo sed -i "23 s/^#//g" $PROJECT_DIRECTORY/.env
    sudo sed -i "24 s/^#//g" $PROJECT_DIRECTORY/.env
    sudo sed -i "25 s/^#//g" $PROJECT_DIRECTORY/.env
    sudo sed -i "26 s/^#//g" $PROJECT_DIRECTORY/.env
    sudo sed -i "27 s/^#//g" $PROJECT_DIRECTORY/.env
    sudo sed -i '22 s/=sqlite/=mysql/' $PROJECT_DIRECTORY/.env
    sudo sed -i '23 s/=127.0.0.1/=localhost/' $PROJECT_DIRECTORY/.env
    sudo sed -i '24 s/=3306/=3306/' $PROJECT_DIRECTORY/.env
    sudo sed -i '25 s/=laravel/='$MYSQL_DB'/' $PROJECT_DIRECTORY/.env
    sudo sed -i '26 s/=root/='$MYSQL_USER'/' $PROJECT_DIRECTORY/.env
    sudo sed -i '27 s/=/='$MYSQL_PASSWORD'/' $PROJECT_DIRECTORY/.env
}

# Function to run artisan commands
run_artisan() {
    cd $PROJECT_DIRECTORY
    sudo php artisan key:generate
    sudo php artisan storage:link
    sudo php artisan migrate
    sudo php artisan db:seed
}

# Function to restart Apache
restart_apache() {
    sudo systemctl restart apache2
}

# Main deployment function
deploy() {
    install_required
    restart_apache
    install_composer
    clone_repo
    composer_dependencies
    create_env
    configure_apache
    restart_apache
    install_configure_mysql
    modify_env
    run_artisan
    restart_apache
    echo "Deployment successful"
}

# Execute deployment function
deploy
