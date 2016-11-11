mkdir /treptest
mkdir /treptest/base
mkdir /treptest/docs

cd game-media
cp *.dll /treptest
cp trep* /treptest
cd pak0-gpl2data
zip -r /treptest/base/pak0-gpl2data.pk3 *
cd ..
cd pak1-ccdata
zip -r /treptest/base/pak1-ccdata.pk3 *
cd ..
cd pak0-vms
zip -r /treptest/pak0-vms.pk3 *
cd ..
cp Docs/server/* /treptest/base
cp Docs/linux/*.sh /treptest/build
cp Docs/linux/R* /treptest/docs
cp Docs/quake3/* /treptest/docs
cp Docs/*.txt /treptest/docs
cp Docs/*.TXT /treptest/docs
cp Docs/*.bat /treptest
cp Docs/*.html /treptest/docs



