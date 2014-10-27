# Install R based on https://sites.google.com/site/onmyraspberrypi/instal-r"
# Firstly get the repository SSL key and import it in to apt.

gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
echo "deb http://cran.ma.imperial.ac.uk/bin/linux/ubuntu precise/" >> /etc/apt/sources.list

apt-get update

# Get and build cmake
wget http://www.cmake.org/files/v2.8/cmake-2.8.11.2.tar.gz
tar xzf cmake-2.8.11.2.tar.gz
cd cmake-2.8.11.2
./configure
make
make install

# --force-yes to handle the un-verified deb
apt-get install r-base-dev r-base -y --force-yes


R -e "install.packages('codetools', repos='http://cran.rstudio.com/')"
R -e "install.packages('Rcpp', repos='http://cran.rstudio.com/')"
R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"

# install libssl0.9.8 that is required for installing shiny server
apt-get install libssl0.9.8

apt-get install gdebi-core -y
wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.2.3.368-amd64.deb
dpkg -i shiny-server-1.2.3.368-amd64.deb

#gdebi shiny-server-1.2.3.368-amd64.deb


# install shiny pakages
R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
R -e "install.packages('shinyBS', repos='http://cran.rstudio.com/')"
R -e "install.packages('lattice', repos='http://cran.rstudio.com/')"
R -e "install.packages('rmarkdown', repos='http://cran.rstudio.com/')"


