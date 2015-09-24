export qt_arch=x86_64
if [ "$(uname -m)" == "i386" ]; then
  export qt_arch=i386
fi
if [ "$(uname -m)" == "i686" ]; then
  export qt_arch=i386
fi

if [ -z "$QPATH" ]; then
	export QPATH=/home/tanel/Qt5.5.0/5.5/gcc_64/
fi
if [ -z "$QLIBPATH" ]; then
	export QLIBPATH=/home/tanel/Qt5.5.0/5.5/gcc_64/lib
fi

set -e

echo "Creating package"

out=out/linux/toggldesktop

rm -rf toggldesktop*.tar.gz $out

mkdir -p $out

cp src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so.1 $out/.

cp src/ui/linux/README $out/.

cp third_party/bugsnag-qt/build/release/libbugsnag-qt.so.1 $out/.

cp third_party/poco/lib/Linux/x86_64/libPocoCrypto.so.31 $out/.
cp third_party/poco/lib/Linux/x86_64/libPocoData.so.31 $out/.
cp third_party/poco/lib/Linux/x86_64/libPocoDataSQLite.so.31 $out/.
cp third_party/poco/lib/Linux/x86_64/libPocoFoundation.so.31 $out/.
cp third_party/poco/lib/Linux/x86_64/libPocoJSON.so.31 $out/.
cp third_party/poco/lib/Linux/x86_64/libPocoNet.so.31 $out/.
cp third_party/poco/lib/Linux/x86_64/libPocoNetSSL.so.31 $out/.
cp third_party/poco/lib/Linux/x86_64/libPocoUtil.so.31 $out/.
cp third_party/poco/lib/Linux/x86_64/libPocoXML.so.31 $out/.

cp src/ui/linux/TogglDesktop/build/release/TogglDesktop $out/.

chrpath -r "\$ORIGIN" $out/TogglDesktop

# copy icons
cp -r src/ui/linux/TogglDesktop/icons $out/icons

# SSL library needs to be copied manually
# else local system installed library will get packaged?!?!
rm -rf $out/lib/libssl* $out/lib/libcrypto*

cp src/ssl/cacert.pem $out/.

cd $out/..

tar cvfz toggldesktop_$(uname -m).tar.gz toggldesktop

echo "Packaging done"
