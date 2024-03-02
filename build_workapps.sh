#!/bin/bash

rm -rf ~/rpmbuild
cd support
cd -
cd rpm
./CentOS7.pre.build.sh
./build.sh
cd -
cp -f support/supporting_libs.tar.gz ~/rpmbuild/RPMS/x86_64/turnserver-4.5.2
cp -rf support/supporting_files ~/rpmbuild/RPMS/x86_64/turnserver-4.5.2
cd ~/rpmbuild/RPMS/x86_64
mv turnserver-4.5.2/supporting_files/install.sh turnserver-4.5.2/install.sh
mv turnserver-4.5.2/supporting_files/uninstall.turnserver.sh turnserver-4.5.2/uninstall.turnserver.sh
rm -f turnserver-4.5.2-CentOS7.4-x86_64.tar.gz
tar -czvf turnserver-4.5.2-CentOS7.4-x86_64.tar.gz turnserver-4.5.2
cd -
mv ~/rpmbuild/RPMS/x86_64/turnserver-4.5.2-CentOS7.4-x86_64.tar.gz workapps_output
echo "build successful"
