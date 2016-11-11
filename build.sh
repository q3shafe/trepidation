mkdir /home/trep/www/build
mkdir /home/trep/www/build/base
mkdir /home/trep/www/build/docs

cd /home/trep
git clone https://github.com/q3shafe/trepidation.git
cd trepidation/game-media
cp *.dll /home/trep/www/build
cp trep* /home/trep/www/build
cd pak0-gpl2data
zip -r /home/trep/www/build/base/pak0-gpl2data.pk3 *
cd ..
cd pak1-ccdata
zip -r /home/trep/www/build/base/pak1-ccdata.pk3 *
cd ..
cd pak0-vms
zip -r /home/trep/www/build/base/pak0-vms.pk3 *
cp /home/trep/trepidation/Docs/server/* /home/trep/www/build/base
cp /home/trep/trepidation/Docs/linux/*.sh /home/trep/www/build
cp /home/trep/trepidation/Docs/linux/R* /home/trep/www/docs
cp /home/trep/trepidation/Docs/quake3/* /home/trep/www/build/docs
cp /home/trep/trepidation/Docs/*.txt /home/trep/www/build/docs
cp /home/trep/trepidation/Docs/*.TXT /home/trep/www/build/docs
cp /home/trep/trepidation/Docs/*.bat /home/trep/www/build
cp /home/trep/trepidation/Docs/*.html /home/trep/www/build/docs
cd /home/trep/www/build
zip -r trep-snapshot.zip *
cp *.zip /home/trep
cd /home/trep/trepidation
rm -rf *
rm -rf .g*
cd /home/trep
rmdir trepidation
cd /home/trep/www/build
rm -rf *
cd /home/trep
cp trep-snapshot.zip /home/sites/1601/www/dls
rm trep-snapshot.zip

