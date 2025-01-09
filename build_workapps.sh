set -x
#!/bin/bash

version=$(cat rpm/turnserver.spec | grep Version | awk '{print $2}')
rm -rf ~/rpmbuild
pushd support
popd
pushd rpm
./CentOS7.pre.build.sh
./build.sh
popd
cp -f support/supporting_libs.tar.gz ~/rpmbuild/RPMS/x86_64/turnserver-${version}
cp -rf support/supporting_files ~/rpmbuild/RPMS/x86_64/turnserver-${version}
pushd ~/rpmbuild/RPMS/x86_64
mv turnserver-${version}/supporting_files/install.sh turnserver-${version}/install.sh
mv turnserver-${version}/supporting_files/uninstall.turnserver.sh turnserver-${version}/uninstall.turnserver.sh
os=$(./turnserver-${version}/supporting_files/get_os_info.sh)
rm -f turnserver-${version}-${os}-x86_64.tar.gz
rm ./turnserver-${version}/supporting_files/get_os_info.sh
tar -czvf turnserver-${version}-${os}-x86_64.tar.gz turnserver-${version}
popd
mv ~/rpmbuild/RPMS/x86_64/turnserver-${version}-${os}-x86_64.tar.gz workapps_output
echo "build successful"
