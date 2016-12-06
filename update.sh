echo "Update from github\n"
echo "This will build you a working snapshot of Trepidation\n";
echo "The working game directory will be trep/build\n";
echo "YOU MUST RUN THE BUILD.SH SCRIPT FIRST!\n";
mkdir trep
cd trep
mkdir build
mkdir build/base
mkdir build/docs
git checkout https://github.com/q3shafe/trepidation.git
cd trepidation/game-media
cp *.dll ../../build
cp trep* ../../build
cd pak0-gpl2data
zip -r ../../../build/base/pak0-gpl2data.pk3 *
cd ..
cd pak1-ccdata
zip -r ../../../build/base/pak1-ccdata.pk3 *
cd ..
cd pak0-vms
zip -r ../../../build/base/pak0-vms.pk3 *
cd ../../../
cp trepidation/Docs/server/* build/base
cp trepidation/Docs/linux/*.sh build/
cp trepidation/Docs/linux/R* build/docs/
cp trepidation/Docs/quake3/* build/docs/
cp trepidation/Docs/*.txt build/docs/
cp trepidation/Docs/*.TXT build/docs/
cp trepidation/Docs/*.bat build/
cd build
#zip -r trep-snapshot.zip *