#!/usr/bin/env bash

# fetches all required packages and copies them to the ROOT folder

ROOT='../../../files/cache/'

# creates the root folder if it does not exist
if [[ ! -e $ROOT ]]; then
    mkdir -p $ROOT
fi

# removes files from the root folder if 'clean' is passed as parameter to the shell script
if [[ $1 == "clean" ]]; then
    echo "Refreshing cache in progress...\n"
    rm $ROOT*
fi

download() {
    # if the requested file does not exist in the root folder
    if [[ ! -e $ROOT$2 ]]; then
        # if a header string is specified for the download
        if [[ $3 ]]; then
            # download using the specified HTTP header
            wget --header "$3" -O $ROOT$2 $1$2
        else
            # download without an HTTP header
            wget -O $ROOT$2 $1$2
        fi
    fi
}

# download from URI but assign different filename
downloadTo() {
    if [[ ! -e $ROOT$2 ]]; then
        wget -O $ROOT$2 $1
    fi
}

# download the following files to the root folder if they do not exist
download "http://download.oracle.com/otn-pub/java/jdk/8u66-b17/" "jdk-8u66-linux-x64.rpm" "Cookie: oraclelicense=accept-securebackup-cookie"
download "https://dl.google.com/linux/direct/" "google-chrome-stable_current_x86_64.rpm"
download "http://mirror.centos.org/centos/7.1.1503/extras/x86_64/Packages/" "docker-1.7.1-115.el7.x86_64.rpm"
download "https://dl.bintray.com/sbt/native-packages/sbt/0.13.9/" "sbt-0.13.9.zip"
download "https://services.gradle.org/distributions/" "gradle-2.8-bin.zip"
download "http://mirrors.muzzy.org.uk/apache/maven/maven-3/3.3.3/binaries/" "apache-maven-3.3.3-bin.zip"
download "http://downloads.typesafe.com/typesafe-activator/1.3.6/" "typesafe-activator-1.3.6.zip"
download "http://mirror.centos.org/centos/7.1.1503/os/x86_64/Packages/" "perl-5.16.3-285.el7.x86_64.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "wandisco-git-release-7-1.noarch.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "git-2.4.1-1.WANdisco.259.x86_64.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "perl-Git-2.4.1-1.WANdisco.259.noarch.rpm"
download "http://dl.bintray.com/groovy/maven/" "apache-groovy-binary-2.4.5.zip"
download "https://dl.bintray.com/mitchellh/vagrant/" "vagrant_1.7.4_x86_64.rpm"
download "https://d1opms6zj7jotq.cloudfront.net/idea/" "ideaIU-15.0.1.tar.gz"
download "http://downloads.typesafe.com/scalaide-pack/4.2.0-vfinal-luna-211-20150928/" "scala-SDK-4.2.0-vfinal-2.11-linux.gtk.x86_64.tar.gz"
download "http://ftp.fau.de/eclipse/technology/epp/downloads/release/mars/R/" "eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz"
download "https://bitbucket.org/rhiokim/haroopad-download/downloads/" "haroopad-v0.13.1-x64.tar.gz"
download "http://dev.mysql.com/get/Downloads/MySQLGUITools/" "mysql-workbench-community-6.3.4-1.el7.x86_64.rpm"
download "http://robomongo.org/files/linux/" "robomongo-0.8.5-x86_64.rpm"
