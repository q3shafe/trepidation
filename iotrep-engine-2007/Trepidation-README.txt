-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  TREPIDATION SOURCE CODE
 www.planettrepidation.com
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-



=====================
Compiling From Source
===================== 
Trepidation's source code is available via our Sourceforge Subversion Repository. 
http://svn.sourceforge.net/trepidation

This project's SourceForge.net Subversion repository can be checked out through SVN with the following instruction set:

svn co https://svn.sourceforge.net/svnroot/trepidation trepidation

(Warning: This is a generic Subversion checkout command which will pull all modules, tags and/or branches of the project. Please use "Browse Repository" link; in most cases, you will want to add '/trunk' to the HTTPS URL above to check out only trunk (main development line)).

Updates from within the module's directory do not need the URL string.

NOTE: UNIX file and directory names are case sensitive.

=============
Prerequisites
=============

- SDL is required (everywhere but Windows), Linux users need development packages if they want to compile the game. You can optionally disable SDL in the Makefile but this configuration is currently untested.

- OpenAL is optionally disable-able. Apple Mac OS X 10.4 comes with OpenAL.

- Subversion is used for acquiring our modified version of the id source code. If you're using a binary package, then you won't need this.

- Apple Mac OS X users need X Code installed for gcc, and subversion and other interesting things.

- LibMAD: is used for MP3 support (as of 07-01-07).

- Ogg/Vorbis is the preferred sound format in Trepidation (as of 07-01-07)

This part assumes Windows users are using Cygwin. If you aren't, TortoiseSVN is a good client.
Change into a directory that you want the tree to be kept in.

Check out the source tree:

svn co https://svn.sourceforge.net/svnroot/trepidation trepidation
(You can check out a specific revision with the -r option, like this: svn svn co https://svn.sourceforge.net/svnroot/trepidation trepidation -r100) 
Read the README file. Really. Do it.

=====================
Compile and install: 
====================

For *nix
  1. Change to the directory containing this readme.
  2. Run 'make'.

For Windows, using MinGW
  1. Download and install MinGW and MSys from http://www.mingw.org/.
  2. Download http://www.libsdl.org/extras/win32/common/directx-devel.tar.gz
     and untar it into your MinGW directory (usually C:\MinGW).
  3. Open an MSys terminal, and follow the instructions for compiling on *nix.

For Windows, using MSVC
  1. Run Visual Studio and open the quake3.sln file in the code/win32/msvc
     directory.
  2. Build.
  3. Copy the resultant Quake3.exe to your quake 3 directory, make a backup if
     you want to keep your original. If you wish to use native libraries, copy
     the resultant dlls to your baseq3 directory.

For Mac OS X, building a Universal Binary
  1. Install the MacOSX10.2.8.sdk and MacOSX10.4u.sdk which are included in
     XCode 2.2 and newer.
  2. Change to the directory containing this README file.
  3. Run './make-macosx-ub.sh'
  4. Copy the resulting ioquake3.app in /build/release-darwin-ub to your 
     /Applications/ioquake3 folder.

Installation, for *nix
  1. Set the COPYDIR variable in the shell to be where you installed Quake 3
     to.  By default it will be /usr/local/games/quake3 if you haven't set it.
     This is the path as used by the original Linux Q3 installer and subsequent
     point releases.
  2. Run 'make copyfiles'.

It is also possible to cross compile for Windows under *nix using MinGW. A
script is available to build a cross compilation environment from
http://www.libsdl.org/extras/win32/cross/build-cross.sh. The gcc/binutils
version numbers that the script downloads may need to be altered. After you
have successfully run this script cross compiling is simply a case of using
'./cross-make-mingw.sh' in place of 'make'.

If the make based build system is being used (i.e. *nix or MinGW), the
following variables may be set, either on the command line or in
Makefile.local:

  OPTIMIZE          - use this for custom CFLAGS
  DEFAULT_BASEDIR   - extra path to search for baseq3 and such
  BUILD_SERVER      - build the 'ioq3ded' server binary
  BUILD_CLIENT      - build the 'ioquake3' client binary
  BUILD_CLIENT_SMP  - build the 'ioquake3-smp' client binary
  BUILD_GAME_SO     - build the game shared libraries
  BUILD_GAME_QVM    - build the game qvms
  USE_SDL           - use the SDL backend where available
  USE_OPENAL        - use OpenAL where available
  USE_OPENAL_DLOPEN - link with OpenAL at runtime
  USE_CURL          - use libcurl for http/ftp download support
  USE_CURL_DLOPEN   - link with libcurl at runtime
  USE_CODEC_VORBIS  - enable Ogg Vorbis support
  USE_CODEC_MP3     - enable MP3 support. Requires libmad to be installed.
  USE_LOCAL_HEADERS - use headers local to ioq3 instead of system ones
  USE_CCACHE        - use ccache compiler caching tool
  COPYDIR           - the target installation directory

The defaults for these variables differ depending on the target platform.


==========
New cvars
==========
  cl_autoRecordDemo                 - record a new demo on each map change
  cl_aviFrameRate                   - the framerate to use when capturing video
  cl_aviMotionJpeg                  - use the mjpeg codec when capturing video

  s_useOpenAL                       - use the OpenAL sound backend if available
  s_alPrecache                      - cache OpenAL sounds before use
  s_alGain                          - the value of AL_GAIN for each source
  s_alSources                       - the total number of sources (memory) to
                                      allocate
  s_alDopplerFactor                 - the value passed to alDopplerFactor
  s_alDopplerSpeed                  - the value passed to alDopplerVelocity
  s_alMinDistance                   - the value of AL_REFERENCE_DISTANCE for
                                      each source
  s_alMaxDistance                   - the maximum distance before sounds start
                                      to become inaudible.
  s_alRolloff                       - the value of AL_ROLLOFF_FACTOR for each
                                      source
  s_alGraceDistance                 - after having passed MaxDistance, length
                                      until sounds are completely inaudible.
  s_alMaxSpeakerDistance            - ET_SPEAKERS beyond this distance are
                                      culled
  s_alDriver                        - which OpenAL library to use
  s_alDevice                        - which OpenAL device to use
  s_alAvailableDevices              - list of available OpenAL devices

  s_sdlBits                         - SDL bit resolution
  s_sdlSpeed                        - SDL sample rate
  s_sdlChannels                     - SDL number of channels
  s_sdlDevSamps                     - SDL DMA buffer size override
  s_sdlMixSamps                     - SDL mix buffer size override

  ttycon_ansicolor                  - enable use of ANSI escape codes in the tty
  r_GLlibCoolDownMsec               - wait for some milliseconds to close GL
                                      library
  com_altivec                       - enable use of altivec on PowerPC systems
  s_backend                         - read only, indicates the current sound
                                      backend
  in_shiftedKeys                    - non-SDL Linux only; enables binding to
                                      shifted keys
  in_joystickNo                     - SDL only; select which joystick to use
  cl_consoleHistory                 - read only, stores the console history
  cl_platformSensitivity            - read only, indicates the mouse input
                                      scaling
  r_ext_texture_filter_anisotropic  - anisotropic texture filtering
  cl_cURLLib                        - filename of cURL library to load
  sv_dlURL                          - the base of the HTTP or FTP site that
                                      holds custom pk3 files for your server 	
  cl_multiuser			    - Set to 1 if you want screenshots, downloads & config files stored in the APP DATA folder on windows.

New commands
  video [filename]        - start video capture (use with demo command)
  stopvideo               - stop video capture



http://www.planettrepidation.com


