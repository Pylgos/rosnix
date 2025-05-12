{ lib }:
final: prev:
let
  rosPy = final.rosConfig.rosPython;
in
{
  # nav2_mppi_controller breaks in xsimd 13.0.0 (direction of cmd_vel is reversed for some reason)
  xsimd = prev.xsimd.overrideAttrs rec {
    version = "12.1.1";
    src = final.fetchFromGitHub {
      owner = "xtensor-stack";
      repo = "xsimd";
      rev = version;
      hash = "sha256-ofUFieeRtpnzNv3Ad5oYwKWb2XcqQHoj601TIhydJyI=";
    };
  };

  webots = final.callPackage ./webots { };

  rosPython = rosPy // {
    pkgs = rosPy.pkgs.overrideScope (
      pyFinal: pyPrev:
      let
        pkgList =
          (final.poetry2nix.mkPoetryPackages {
            projectDir = ./poetry;
            python = rosPy;
            overrides = final.poetry2nix.overrides.withDefaults (
              final: prev: {
                inherit (pyFinal)
                  argcomplete
                  colorama
                  coloredlogs
                  coverage
                  dateutil
                  distlib
                  distro
                  docutils
                  flake8
                  humanfriendly
                  iniconfig
                  mccabe
                  notify2
                  packaging
                  pluggy
                  pycodestyle
                  pyflakes
                  pyparsing
                  pyreadline3
                  pytest
                  pytest-cov
                  pytest-repeat
                  pytest-rerunfailures
                  python-dateutil
                  pyyaml
                  setuptools
                  six
                  ;
                flake8-builtins = prev.flake8-builtins.overridePythonAttrs (oldAttras: {
                  nativeBuildInputs = oldAttras.nativeBuildInputs ++ [ final.hatchling ];
                });
              }
            );
          }).poetryPackages;
        pkgsByName = lib.listToAttrs (
          map (drv: {
            name = drv.pname;
            value = drv;
          }) pkgList
        );
      in
      {
        inherit (pkgsByName)
          catkin-pkg
          colcon-bash
          colcon-cd
          colcon-cmake
          colcon-common-extensions
          colcon-core
          colcon-library-path
          colcon-metadata
          colcon-ros
          colcon-zsh
          empy
          flake8-builtins
          flake8-comprehensions
          flake8-quotes
          rosdistro
          ;
      }
    );
  };
  rosPythonPackages = final.rosPython.pkgs;

  rosSystemPackages = final.lib.makeExtensibleWithCustomName "overrideScope" (self: {
    getPackages =
      {
        forBuildInputs ? [ ],
        forNativeBuildInputs ? [ ],
        forDepsTargetTarget ? [ ],
      }@args:
      let
        attrPos =
          if args ? forBuildInputs then
            builtins.unsafeGetAttrPos "forBuildInputs" args
          else if args ? forNativeBuildInputs then
            builtins.unsafeGetAttrPos "forNativeBuildInputs" args
          else
            builtins.unsafeGetAttrPos "forDepsTargetTarget" args;
        getPkgsFrom =
          names: pkgs:
          lib.concatLists (
            map (
              name:
              pkgs.rosSystemPackages.${name}
                or (lib.warn "rosnix: ${attrPos.file}: system package ${name} not found" [ ])
            ) names
          );
      in
      (getPkgsFrom forBuildInputs final)
      ++ (getPkgsFrom forNativeBuildInputs final.buildPackages)
      ++ (getPkgsFrom forDepsTargetTarget final.pkgsTargetTarget);

    ace = [ final.ace ];
    ack = [ final.ack ];
    ack-grep = [ final.ack ];
    acl = [ final.acl ];
    acpi = [ final.acpi ];
    acpitool = [ final.acpitool ];
    alsa-oss = [ final.alsaOss ];
    alsa-utils = [ final.alsaUtils ];
    ant = [ final.ant ];
    antlr = [ final.antlr ];
    apache2 = [ final.apacheHttpd ];
    apr = [ final.apr ];
    aravis = [ final.aravis ];
    aravis-dev = [ final.aravis ];
    arduino-core = [ final.arduino ];
    armadillo = [ final.armadillo ];
    asio = [ final.asio ];
    assimp = [ final.assimp ];
    assimp-dev = [ final.assimp ];
    at-spi2-core = [ final.at-spi2-core ];
    autoconf = [ final.autoconf ];
    automake = [ final.automake ];
    autossh = [ final.autossh ];
    avahi-daemon = [ final.avahi ];
    avahi-utils = [ final.avahi ];
    avrdude = [ final.avrdude ];
    awscli = [ final.awscli ];
    babeltrace = [ final.babeltrace ];
    bazaar = [ final.breezy ];
    beep = [ final.beep ];
    benchmark = [ final.gbenchmark ];
    binutils = [ final.binutils ];
    bison = [ final.bison ];
    black = [ final.rosPythonPackages.black ];
    blende = [ final.blender ];
    bluez = [ final.bluez ];
    boost = [ final.rosPythonPackages.boost ];
    box2d-dev = [ final.box2d ];
    bullet = [ final.bullet ];
    bullet-extras = [ final.bullet ];
    bzip2 = [ final.bzip2 ];
    ca-certificates = [ final.cacert ];
    can-utils = [ final.can-utils ];
    cargo = [ final.cargo ];
    cccc = [ final.cccc ];
    cdk = [ final.cdk ];
    cdk-dev = [ final.cdk ];
    cgal = [ final.cgal_5 ];
    chromium-browser = [ final.chromium ];
    chrony = [ final.chrony ];
    clang = [ final.clang ];
    clang-format = [ final.clang ];
    clang-tidy = [ final.clang ];
    cli11 = [ final.cli11 ];
    cmake = [
      final.cmake
      final.pkg-config
    ];
    collada-dom = [ final.collada-dom ];
    coreutils = [ final.coreutils ];
    couchdb = [ final.couchdb3 ];
    cppcheck = [ final.cppcheck ];
    cppunit = [ final.cppunit ];
    curl = [ final.curl ];
    curlpp-dev = [ final.curlpp ];
    cvs = [ final.cvs ];
    cwiid = [ final.cwiid ];
    cwiid-dev = [ final.cwiid ];
    cython3 = [ final.rosPythonPackages.cython ];
    daemontools = [ final.daemontools ];
    devilspie2 = [ final.devilspie2 ];
    dfu-util = [ final.dfu-util ];
    dkms = [ ];
    dnsmasq = [ final.dnsmasq ];
    docker-compose = [ final.docker-compose ];
    doxygen = [ final.doxygen ];
    dpkg = [ final.dpkg ];
    dpkg-dev = [ final.dpkg ];
    e2fsprogs = [ final.e2fsprogs ];
    ed = [ final.ed ];
    eigen = [ final.eigen ];
    eigen2 = [ final.eigen2 ];
    emacs = [ final.emacs ];
    embree = [ final.embree ];
    enblend = [ final.enblend-enfuse ];
    enet = [ final.enet ];
    espeak = [ final.espeak ];
    exfat-utils = [ final.exfat ];
    f2c = [ final.libf2c ];
    fakeroot = [ final.fakeroot ];
    ffmpeg = [ final.ffmpeg ];
    ffmpeg-dev = [ final.ffmpeg ];
    file = [ final.file ];
    filezilla = [ final.filezilla ];
    flac = [ final.flac ];
    flex = [ final.flex ];
    fltk = [ final.fltk ];
    fluid = [ final.fltk ];
    fmt = [ final.fmt ];
    freetype = [ final.freetype ];
    fsharp = [ final.fsharp ];
    fswebcam = [ final.fswebcam ];
    ftdi-eeprom = [ final.libftdi ];
    "g++-static" = [ ];
    gawk = [ final.gawk ];
    gdal-bin = [ final.gdal ];
    geographiclib = [ final.geographiclib ];
    geos = [ final.geos ];
    gettext-base = [ final.gettext ];
    gforth = [ final.gforth ];
    gfortran = [ final.gfortran ];
    ghc = [ final.ghc ];
    gifsicle = [ final.gifsicle ];
    gimp = [ final.gimp ];
    git = [ final.git ];
    git-lfs = [ final.git-lfs ];
    gitg = [ final.gitg ];
    glc = [ final.quesoglc ];
    glslang-dev = [ final.glslang ];
    glslc = [ final.shaderc ];
    glut = [ final.freeglut ];
    gnat = [ final.gnat ];
    gnome-terminal = [ final.gnome.gnome-terminal ];
    gnuplot = [ final.gnuplot ];
    golang-go = [ final.go ];
    google-mock = [ final.gtest ];
    gperftools = [ final.gperftools ];
    gphoto2 = [ final.gphoto2 ];
    gpsd = [ final.gpsd ];
    gradle = [ final.gradle ];
    graphicsmagick = [ final.graphicsmagick ];
    graphviz = [ final.graphviz ];
    graphviz-dev = [ final.graphviz ];
    gringo = [ final.gringo ];
    "gstreamer1.0" = [ final.gst_all_1.gstreamer ];
    "gstreamer1.0-alsa" = [ final.gst_all_1.gst-plugins-base ];
    "gstreamer1.0-gl" = [ final.gst_all_1.gst-plugins-base ];
    "gstreamer1.0-libav" = [ final.gst_all_1.gst-libav ];
    "gstreamer1.0-plugins-bad" = [ final.gst_all_1.gst-plugins-bad ];
    "gstreamer1.0-plugins-base" = [ final.gst_all_1.gst-plugins-base ];
    "gstreamer1.0-plugins-good" = [ final.gst_all_1.gst-plugins-good ];
    "gstreamer1.0-plugins-ugly" = [ final.gst_all_1.gst-plugins-ugly ];
    gtest = [ final.gtest ];
    gtk-doc-tools = [ final.gtk-doc ];
    gtk2 = [ final.gtk2 ];
    gtk3 = [ final.gtk3 ];
    gv = [ final.gv ];
    gz-cmake3 = [ ];
    gz-common5 = [ ];
    gz-fuel_tools9 = [ ];
    gz-gui8 = [ ];
    gz-math7 = [ ];
    gz-msgs10 = [ ];
    gz-physics7 = [ ];
    gz-plugin2 = [ ];
    gz-rendering8 = [ ];
    gz-sensors8 = [ ];
    gz-sim8 = [ ];
    gz-tools2 = [ ];
    gz-transport13 = [ ];
    gz-utils2 = [ ];
    hddtemp = [ final.hddtemp ];
    hdf5 = [ final.hdf5 ];
    hostapd = [ final.hostapd ];
    hostname = [ final.hostname ];
    htop = [ final.htop ];
    hugin-tools = [ final.hugin ];
    i2c-tools = [ final.i2c-tools ];
    ifstat = [ final.ifstat-legacy ];
    imagemagick = [ final.imagemagick ];
    intltool = [ final.intltool ];
    iperf = [ final.iperf ];
    ipmitool = [ final.ipmitool ];
    iproute2 = [ final.iproute2 ];
    iputils-ping = [ final.unixtools.ping ];
    ipython3 = [ final.rosPythonPackages.ipython ];
    iwyu = [ final.include-what-you-use ];
    jack = [ final.jack2 ];
    jasper = [ final.jasper ];
    java = [ final.openjdk ];
    joystick = [ final.linuxConsoleTools ];
    jq = [ final.jq ];
    jupyter-nbconvert = [ final.rosPythonPackages.nbconvert ];
    jupyter-notebook = [ final.jupyter ];
    jython = [ final.jython ];
    kakasi = [ final.kakasi ];
    kate = [ final.plasma5Packages.kate ];
    kgraphviewer = [ final.kgraphviewer ];
    konsole = [ final.plasma5Packages.konsole ];
    lcov = [ final.lcov ];
    leveldb = [ final.leveldb ];
    libabsl-dev = [ final.abseil-cpp ];
    libasound2-dev = [ final.alsaLib ];
    libatomic = [ ];
    libavahi-client-dev = [ final.avahi ];
    libavahi-core-dev = [ final.avahi ];
    libb64-dev = [ final.libb64 ];
    libbison-dev = [ final.bison ];
    libblas-dev = [ final.blas ];
    libbluetooth = [ final.bluez ];
    libbluetooth-dev = [ final.bluez ];
    libboost-atomic = [ final.rosPythonPackages.boost ];
    libboost-atomic-dev = [ final.rosPythonPackages.boost ];
    libboost-chrono = [ final.rosPythonPackages.boost ];
    libboost-chrono-dev = [ final.rosPythonPackages.boost ];
    libboost-date-time = [ final.rosPythonPackages.boost ];
    libboost-date-time-dev = [ final.rosPythonPackages.boost ];
    libboost-dev = [ final.rosPythonPackages.boost ];
    libboost-filesystem = [ final.rosPythonPackages.boost ];
    libboost-filesystem-dev = [ final.rosPythonPackages.boost ];
    libboost-iostreams = [ final.rosPythonPackages.boost ];
    libboost-iostreams-dev = [ final.rosPythonPackages.boost ];
    libboost-math = [ final.rosPythonPackages.boost ];
    libboost-math-dev = [ final.rosPythonPackages.boost ];
    libboost-numpy-dev = [ final.rosPythonPackages.boost ];
    libboost-program-options = [ final.rosPythonPackages.boost ];
    libboost-program-options-dev = [ final.rosPythonPackages.boost ];
    libboost-python = [ final.rosPythonPackages.boost ];
    libboost-python-dev = [ final.rosPythonPackages.boost ];
    libboost-random = [ final.rosPythonPackages.boost ];
    libboost-random-dev = [ final.rosPythonPackages.boost ];
    libboost-regex = [ final.rosPythonPackages.boost ];
    libboost-regex-dev = [ final.rosPythonPackages.boost ];
    libboost-serialization = [ final.rosPythonPackages.boost ];
    libboost-serialization-dev = [ final.rosPythonPackages.boost ];
    libboost-system = [ final.rosPythonPackages.boost ];
    libboost-system-dev = [ final.rosPythonPackages.boost ];
    libboost-thread = [ final.rosPythonPackages.boost ];
    libboost-thread-dev = [ final.rosPythonPackages.boost ];
    libboost-timer = [ final.rosPythonPackages.boost ];
    libboost-timer-dev = [ final.rosPythonPackages.boost ];
    libbsd-dev = [ final.libbsd ];
    libcairo2-dev = [ final.cairo ];
    libcap-dev = [ final.libcap ];
    libcap-ng-dev = [ final.libcap_ng ];
    libcap-ng0 = [ final.libcap_ng ];
    libcap2 = [ final.libcap ];
    libcap2-bin = [ final.libcap ];
    libccd-dev = [ final.libccd ];
    libcdd-dev = [ final.cddlib ];
    libcegui-mk2-dev = [ final.cegui ];
    libceres-dev = [ final.ceres-solver ];
    libcgroup-dev = [ final.libcgroup ];
    libclang-dev = [ final.clang ];
    "libconfig++-dev" = [ final.libconfig ];
    libconfig-dev = [ final.libconfig ];
    libconsole-bridge-dev = [ final.console-bridge ];
    libcunit-dev = [ final.cunit ];
    libcurl = [ final.curl ];
    libcurl-dev = [ final.curl ];
    libdbus-dev = [ final.dbus ];
    libdc1394-dev = [ final.libdc1394 ];
    libdevil-dev = [ final.libdevil ];
    libdlib-dev = [ final.dlib ];
    libdmtx-dev = [ final.libdmtx ];
    libdpkg-dev = [ final.dpkg ];
    libdrm-dev = [ final.libdrm ];
    libdw-dev = [ final.elfutils ];
    libdxflib-dev = [ final.libsForQt5.dxflib ];
    libedit = [ final.libedit ];
    libedit-dev = [ final.libedit ];
    libespeak-dev = [ final.espeak ];
    libev-dev = [ final.libev ];
    libevdev-dev = [ final.libevdev ];
    libfcl-dev = [ final.fcl ];
    libffi-dev = [ final.libffi ];
    "libfftw3" = [
      final.fftw
      final.fftwSinglePrec
    ];
    libflann-dev = [ final.flann ];
    libfltk-dev = [ final.fltk ];
    libfreeimage-dev = [ (final.callPackage ./freeimage.nix { }) ];
    libfreenect-dev = [ final.freenect ];
    libfreetype-dev = [ final.freetype ];
    libfreetype6 = [ final.freetype ];
    libfreetype6-dev = [ final.freetype ];
    libftdi-dev = [ final.libftdi ];
    libftdi1-dev = [ final.libftdi1 ];
    libgconf2 = [ final.gnome2.GConf ];
    libgdal-dev = [ final.gdal ];
    "libgeos++-dev" = [ final.geos ];
    libgeotiff-dev = [ final.libgeotiff ];
    libgflags-dev = [ final.gflags ];
    libgif-dev = [ final.giflib ];
    libglew-dev = [ final.glew ];
    libglfw3-dev = [ final.glfw3 ];
    libglib-dev = [ final.glib ];
    libgmock-dev = [ final.gmock ];
    libgmp = [ final.gmp ];
    libgoogle-glog-dev = [ final.glog ];
    libgpgme-dev = [ final.gpgme ];
    libgphoto-dev = [ final.libgphoto2 ];
    libgpiod-dev = [ final.libgpiod ];
    libgps = [ final.gpsd ];
    libgsl = [ final.gsl ];
    "libgstreamer-plugins-base1.0-dev" = [ final.gst_all_1.gst-plugins-base ];
    "libgstreamer1.0-dev" = [ final.gst_all_1.gstreamer ];
    "libgstrtspserver-1.0-0" = [ final.gst_all_1.gst-rtsp-server ];
    "libgstrtspserver-1.0-dev" = [ final.gst_all_1.gst-rtsp-server ];
    libgts = [ final.gts ];
    libhdf5-dev = [ final.hdf5 ];
    libhidapi-dev = [ final.hidapi ];
    libi2c-dev = [ final.i2c-tools ];
    libicu-dev = [ final.icu ];
    libirrlicht-dev = [ final.irrlicht ];
    libiw-dev = [ final.wirelesstools ];
    libjansson-dev = [ final.jansson ];
    libjpeg = [ final.libjpeg ];
    libjson-glib = [ final.json-glib ];
    libjsoncpp = [ final.jsoncpp ];
    libjsoncpp-dev = [ final.jsoncpp ];
    liblapack-dev = [ final.liblapack ];
    libleptonica-dev = [ final.leptonica ];
    liblinear-dev = [ final.liblinear ];
    liblinphone-dev = [ final.liblinphone ];
    liblmdb-dev = [ final.lmdb ];
    liblttng-ust-dev = [ final.lttng-ust ];
    liblz4 = [ final.lz4 ];
    liblz4-dev = [ final.lz4 ];
    liblzma-dev = [ final.xz ];
    libmagick = [ final.imagemagick ];
    libmicrohttpd = [ final.libmicrohttpd ];
    libmodbus-dev = [ final.libmodbus ];
    libmodbus5 = [ final.libmodbus ];
    "libmongoc-1.0-0" = [ final.mongoc ];
    libmongoc-dev = [ final.mongoc ];
    libmpg123-dev = [ final.mpg123 ];
    libmpich-dev = [ final.mpich ];
    libmpich2-dev = [ final.mpich ];
    libncurses-dev = [ final.ncurses ];
    libnl-3 = [ final.libnl ];
    libnl-3-dev = [ final.libnl ];
    libnlopt-cxx-dev = [ final.nlopt ];
    libnlopt-dev = [ final.nlopt ];
    libnlopt0 = [ final.nlopt ];
    libnotify = [ final.libnotify ];
    libnss3-dev = [ final.nss ];
    libogg = [ final.libogg ];
    libogre = [ ];
    libogre-dev = [ ];
    libois-dev = [ final.ois ];
    libomp-dev = [ final.llvmPackages.openmp ];
    libopenal-dev = [ final.openal ];
    libopenblas-dev = [ final.openblas ];
    libopencv-dev = [ final.opencv ];
    libopencv-imgproc-dev = [ final.opencv ];
    libopenexr-dev = [ final.openexr ];
    libopenscenegraph = [ final.openscenegraph ];
    libopenvdb = [ final.openvdb ];
    libopenvdb-dev = [ final.openvdb ];
    liborocos-kdl = [ final.orocos-kdl ];
    liborocos-kdl-dev = [ final.orocos-kdl ];
    libpcap = [ final.libpcap ];
    libpcl-all = [ final.pcl ];
    libpcl-all-dev = [ final.pcl ];
    libpcl-common = [ final.pcl ];
    libpcl-io = [ final.pcl ];
    libpcsclite-dev = [ final.pcsclite ];
    "libpng++-dev" = [ final.pngpp ];
    libpng-dev = [ final.libpng ];
    libpng12-dev = [ final.libpng12 ];
    libpoco-dev = [ final.poco ];
    libpopt-dev = [ final.popt ];
    libpq-dev = [ final.postgresql ];
    libpqxx = [ final.libpqxx ];
    libpqxx-dev = [ final.libpqxx ];
    libprocps-dev = [ final.procps ];
    libpulse-dev = [ final.pulseaudio ];
    libqglviewer-dev-qt5 = [ final.libsForQt5.libqglviewer ];
    libqglviewer2-qt5 = [ final.libsForQt5.libqglviewer ];
    libqhull = [ final.qhull ];
    libqrencode = [ final.qrencode ];
    libqrencode-dev = [ final.qrencode ];
    libqt5-concurrent = [ final.qt5.qtbase ];
    libqt5-core = [ final.qt5.qtbase ];
    libqt5-gui = [ final.qt5.qtbase ];
    libqt5-multimedia = [ final.qt5.qtmultimedia ];
    libqt5-network = [ final.qt5.qtbase ];
    libqt5-opengl = [ final.qt5.qtbase ];
    libqt5-opengl-dev = [ final.qt5.qtbase ];
    libqt5-printsupport = [ final.qt5.qtbase ];
    libqt5-qml = [ final.qt5.qtdeclarative ];
    libqt5-quick = [ final.qt5.qtdeclarative ];
    libqt5-serialport = [ final.qt5.qtserialport ];
    libqt5-sql = [ final.qt5.qtbase ];
    libqt5-svg = [ final.qt5.qtsvg ];
    libqt5-svg-dev = [ final.qt5.qtsvg ];
    libqt5-websockets-dev = [ final.qt5.qtwebsockets ];
    libqt5-widgets = [ final.qt5.qtbase ];
    libqt5-xml = [ final.qt5.qtbase ];
    libqt5multimedia5-plugins = [ final.qt5.qtmultimedia ];
    libqt5x11extras5-dev = [ final.qt5.qtx11extras ];
    libqwt-qt5-dev = [ final.libsForQt5.qwt ];
    libqwt6 = [ final.libsForQt5.qwt ];
    libraw1394 = [ final.libraw1394 ];
    libraw1394-dev = [ final.libraw1394 ];
    librdkafka-dev = [ final.rdkafka ];
    libreadline = [ final.readline ];
    libreadline-dev = [ final.readline ];
    librtaudio-dev = [ final.rtaudio ];
    libsensors4-dev = [ final.lm_sensors ];
    libshaderc-dev = [ final.shaderc ];
    libsndfile1-dev = [ final.libsndfile ];
    libspatialindex-dev = [ final.libspatialindex ];
    libspatialite = [ final.libspatialite ];
    libspnav-dev = [ final.libspnav ];
    libsqlite3-dev = [ final.sqlite ];
    libssh-dev = [ final.libssh ];
    libssh2 = [ final.libssh2 ];
    libssh2-dev = [ final.libssh2 ];
    libssl-dev = [ final.openssl ];
    "libstdc++6" = [ ];
    libsvm-dev = [ final.libsvm ];
    libsvm3 = [ final.libsvm ];
    libswscale-dev = [ final.ffmpeg ];
    libtclap-dev = [ final.tclap ];
    libtesseract = [ final.tesseract ];
    libtheora = [ final.libtheora ];
    libtiff-dev = [ final.libtiff ];
    libtiff4-dev = [ final.libtiff ];
    libtool = [ final.libtool ];
    libturbojpeg = [ final.libjpeg_turbo ];
    libudev-dev = [ final.udev ];
    libunwind = [ final.libunwind ];
    libunwind-dev = [ final.libunwind ];
    liburdfdom-dev = [ final.urdfdom ];
    liburdfdom-headers-dev = [ final.urdfdom-headers ];
    liburdfdom-tools = [ final.urdfdom ];
    libusb = [ final.libusb-compat-0_1 ];
    "libusb-1.0" = [ final.libusb1 ];
    "libusb-1.0-dev" = [ final.libusb1 ];
    libusb-dev = [ final.libusb1 ];
    libuv1-dev = [ final.libuv ];
    libuvc-dev = [ final.libuvc ];
    libv4l-dev = [ final.libv4l ];
    libvlc = [ final.vlc ];
    libvlc-dev = [ final.vlc ];
    libvpx-dev = [ final.libvpx ];
    libvtk = [ final.vtk ];
    libvtk-qt = [ final.vtkWithQt5 ];
    libvulkan-dev = [ final.vulkan-loader ];
    libwebp-dev = [ final.libwebp ];
    libwebsocketpp-dev = [ final.websocketpp ];
    libwebsockets-dev = [ final.libwebsockets ];
    libx11 = [ final.xorg.libX11 ];
    libx11-dev = [ final.xorg.libX11 ];
    libx11-xcb-dev = [ final.xorg.libxcb ];
    libx264-dev = [ final.x264 ];
    libxaw = [ final.xorg.libXaw ];
    libxcb-randr0-dev = [ final.xorg.libxcb ];
    libxcursor-dev = [ final.xorg.libXcursor ];
    libxext = [ final.xorg.libXext ];
    libxft-dev = [ final.xorg.libXft ];
    libxi-dev = [ final.xorg.libXi ];
    libxinerama-dev = [ final.xorg.libXinerama ];
    "libxml++-2.6" = [ final.libxmlxx ];
    libxml2 = [ final.libxml2 ];
    libxml2-utils = [ final.libxml2 ];
    "libxmlrpc-c++" = [ final.xmlrpc_c ];
    libxmu-dev = [ final.xorg.libXmu ];
    libxrandr = [ final.xorg.libXrandr ];
    libxslt = [ final.libxslt ];
    libxss1 = [ final.xorg.libXScrnSaver ];
    libxt-dev = [ final.xorg.libXtst ];
    libyaml = [ final.libyaml ];
    libyaml-dev = [ final.libyaml ];
    libzip-dev = [ final.libzip ];
    libzmq3-dev = [ final.cppzmq ];
    libzstd-dev = [ final.zstd ];
    lighttpd = [ final.lighttpd ];
    linphone = [ final.linphone ];
    linux-headers-generic = [ final.linuxHeaders ];
    linux-kernel-headers = [ final.linuxHeaders ];
    llvm = [ final.llvm ];
    llvm-dev = [ final.llvm ];
    lm-sensors = [ final.lm_sensors ];
    log4cplus = [ final.log4cplus ];
    log4cxx = [ final.log4cxx ];
    lttng-tools = [ final.lttng-tools ];
    lua-dev = [ final.lua ];
    "lua5.2-dev" = [ final.lua5 ];
    lz4 = [ final.lz4 ];
    m4 = [ final.m4 ];
    matio = [ final.matio ];
    maven = [ final.maven ];
    meld = [ final.meld ];
    mercurial = [ final.mercurial ];
    meshlab = [ final.meshlab ];
    mkdocs = [ final.mkdocs ];
    mongodb = [ final.mongodb ];
    mongodb-dev = [ final.mongodb ];
    mosquitto = [ final.mosquitto ];
    mosquittopp-dev = [ final.mosquitto ];
    mpg123 = [ final.mpg123 ];
    mplayer = [ final.mplayer ];
    msgpack = [ final.msgpack ];
    muparser = [ final.muparser ];
    nasm = [ final.nasm ];
    net-tools = [ final.nettools ];
    netcdf = [ final.netcdf ];
    netpbm = [ final.netpbm ];
    network-manager = [ final.networkmanager ];
    ninja-build = [ final.ninja ];
    nkf = [ final.nkf ];
    nlohmann-json-dev = [ final.nlohmann_json ];
    nmap = [ final.nmap ];
    nodejs = [ final.nodejs ];
    nodejs-legacy = [ final.nodejs ];
    npm = [ final.nodePackages.npm ];
    ntp = [ final.ntp ];
    ntpdate = [ final.ntp ];
    omniidl = [ final.omniorb ];
    omniorb = [ final.omniorb ];
    opencl-headers = [ final.opencl-headers ];
    opende = [ final.ode ];
    opengl = [
      final.libGL
      final.libGLU
    ];
    openmpi = [ final.openmpi ];
    openocd = [ final.openocd ];
    openssh-client = [ final.openssh ];
    openssh-server = [ final.openssh ];
    openssl = [ final.openssl ];
    optipng = [ final.optipng ];
    osm2pgsql = [ final.osm2pgsql ];
    osmium = [ final.libosmium ];
    pandoc = [ final.pandoc ];
    pcre = [ final.pcre ];
    pcre-dev = [ final.pcre ];
    php = [ final.php ];
    pkg-config = [ final.pkg-config ];
    pmount = [ final.pmount ];
    portaudio = [ final.portaudio ];
    portaudio19-dev = [ final.portaudio ];
    postgresql = [ final.postgresql ];
    powertop = [ final.powertop ];
    procps = [ final.procps ];
    proj = [ final.proj ];
    protobuf = [ final.protobuf ];
    protobuf-dev = [ final.protobuf ];
    pstoedit = [ final.pstoedit ];
    psutils = [ final.psutils ];
    pugixml-dev = [ final.pugixml ];
    pybind11-dev = [ final.rosPythonPackages.pybind11 ];
    pydocstyle = [ final.rosPythonPackages.pydocstyle ];
    pyflakes3 = [ final.rosPythonPackages.pyflakes ];
    python3 = [ final.rosPython ];
    python3-alembic = [ final.rosPythonPackages.alembic ];
    python3-argcomplete = [ final.rosPythonPackages.argcomplete ];
    python3-autobahn = [ final.rosPythonPackages.autobahn ];
    python3-bitarray = [ final.rosPythonPackages.bitarray ];
    python3-boto3 = [ final.rosPythonPackages.boto3 ];
    python3-bs4 = [ final.rosPythonPackages.beautifulsoup4 ];
    python3-bson = [ final.rosPythonPackages.pymongo ];
    python3-cairo = [ final.rosPythonPackages.pycairo ];
    python3-cairosvg = [ final.rosPythonPackages.cairosvg ];
    python3-catkin-pkg = [ final.rosPythonPackages.catkin-pkg ];
    python3-catkin-pkg-modules = [ final.rosPythonPackages.catkin-pkg ];
    python3-cffi = [ final.rosPythonPackages.cffi ];
    python3-chainer-pip = [ final.rosPythonPackages.chainer ];
    python3-cherrypy3 = [ final.rosPythonPackages.cherrypy ];
    python3-click = [ final.rosPythonPackages.click ];
    python3-collada = [ final.rosPythonPackages.pycollada ];
    python3-colorama = [ final.rosPythonPackages.colorama ];
    python3-construct = [ final.rosPythonPackages.construct ];
    python3-coverage = [ final.rosPythonPackages.coverage ];
    python3-crcmod = [ final.rosPythonPackages.crcmod ];
    python3-cryptography = [ final.rosPythonPackages.cryptography ];
    python3-dateutil = [ final.rosPythonPackages.python-dateutil ];
    python3-dbus = [ final.rosPythonPackages.dbus-python ];
    python3-decorator = [ final.rosPythonPackages.decorator ];
    python3-defusedxml = [ final.rosPythonPackages.defusedxml ];
    python3-deprecated = [ final.rosPythonPackages.deprecated ];
    python3-dev = [ final.rosPython ];
    python3-distro = [ final.rosPythonPackages.distro ];
    python3-distutils = [ final.rosPython ];
    python3-docker = [ final.rosPythonPackages.docker ];
    python3-docopt = [ final.rosPythonPackages.docopt ];
    python3-docutils = [ final.rosPythonPackages.docutils ];
    python3-empy = [ final.rosPythonPackages.empy ];
    python3-ezdxf = [ final.rosPythonPackages.ezdxf ];
    python3-filelock = [ final.rosPythonPackages.filelock ];
    python3-fiona = [ final.rosPythonPackages.fiona ];
    python3-flake8 = [ final.rosPythonPackages.flake8 ];
    python3-flake8-builtins = [ final.rosPythonPackages.flake8-builtins ];
    python3-flake8-comprehensions = [ final.rosPythonPackages.flake8-comprehensions ];
    python3-flake8-docstrings = [ final.rosPythonPackages.flake8-docstrings ];
    python3-flake8-import-order = [ final.rosPythonPackages.flake8-import-order ];
    python3-flake8-quotes = [ final.rosPythonPackages.flake8-quotes ];
    python3-flask = [ final.rosPythonPackages.flask ];
    python3-flask-jwt-extended = [ final.rosPythonPackages.flask-jwt-extended ];
    python3-future = [ final.rosPythonPackages.future ];
    python3-geographiclib = [ final.rosPythonPackages.geographiclib ];
    python3-geopy = [ final.rosPythonPackages.geopy ];
    python3-gi = [ final.rosPythonPackages.pygobject3 ];
    python3-gi-cairo = [ final.rosPythonPackages.pygobject3 ];
    python3-git = [ final.rosPythonPackages.GitPython ];
    python3-github = [ final.rosPythonPackages.PyGithub ];
    python3-gnupg = [ final.rosPythonPackages.python-gnupg ];
    python3-grpc-tools = [ final.rosPythonPackages.grpcio-tools ];
    python3-grpcio = [ final.rosPythonPackages.grpcio ];
    python3-h5py = [ final.rosPythonPackages.h5py ];
    python3-imageio = [ final.rosPythonPackages.imageio ];
    python3-importlib-metadata = [ final.rosPythonPackages.importlib-metadata ];
    python3-importlib-resources = [ final.rosPythonPackages.importlib-resources ];
    python3-interpreter = [ final.rosPython ];
    python3-jinja2 = [ final.rosPythonPackages.jinja2 ];
    python3-jmespath = [ final.rosPythonPackages.jmespath ];
    python3-joblib = [ final.rosPythonPackages.joblib ];
    python3-jsonschema = [ final.rosPythonPackages.jsonschema ];
    python3-kitchen = [ final.rosPythonPackages.kitchen ];
    python3-lark-parser = [ final.rosPythonPackages.lark ];
    python3-lockfile = [ final.rosPythonPackages.lockfile ];
    python3-lxml = [ final.rosPythonPackages.lxml ];
    python3-mapnik = [ final.rosPythonPackages.python-mapnik ];
    python3-markdown = [ final.rosPythonPackages.markdown ];
    python3-matplotlib = [ final.rosPythonPackages.matplotlib ];
    python3-mechanize = [ final.rosPythonPackages.mechanize ];
    python3-mock = [ final.rosPythonPackages.mock ];
    python3-msgpack = [ final.rosPythonPackages.msgpack ];
    python3-mypy = [ final.rosPythonPackages.mypy ];
    python3-netcdf4 = [ final.rosPythonPackages.netcdf4 ];
    python3-netifaces = [ final.rosPythonPackages.netifaces ];
    python3-networkx = [ final.rosPythonPackages.networkx ];
    python3-nose = [ final.rosPythonPackages.nose ];
    python3-numpy = [ final.rosPythonPackages.numpy ];
    python3-numpy-stl = [ final.rosPythonPackages.numpy-stl ];
    python3-opencv = [ final.rosPythonPackages.opencv4 ];
    python3-opengl = [ final.rosPythonPackages.pyopengl ];
    python3-packaging = [ final.rosPythonPackages.packaging ];
    python3-pandas = [ final.rosPythonPackages.pandas ];
    python3-paramiko = [ final.rosPythonPackages.paramiko ];
    python3-pep8 = [ final.rosPythonPackages.pep8 ];
    python3-pil = [ final.rosPythonPackages.pillow ];
    python3-pip = [ final.rosPythonPackages.pip ];
    python3-pkg-resources = [ final.rosPythonPackages.setuptools ];
    python3-prettytable = [ final.rosPythonPackages.prettytable ];
    python3-progressbar = [ final.rosPythonPackages.progressbar ];
    python3-protobuf = [
      final.rosPythonPackages.protobuf
    ];
    python3-psutil = [ final.rosPythonPackages.psutil ];
    python3-pyaudio = [ final.rosPythonPackages.pyaudio ];
    python3-pyclipper = [ final.rosPythonPackages.pyclipper ];
    python3-pycodestyle = [ final.rosPythonPackages.pycodestyle ];
    python3-pycryptodome = [ final.rosPythonPackages.pycryptodomex ];
    python3-pydot = [ final.rosPythonPackages.pydot ];
    python3-pygame = [ final.rosPythonPackages.pygame ];
    python3-pygraphviz = [ final.rosPythonPackages.pygraphviz ];
    python3-pykdl = [ final.rosPythonPackages.pykdl ];
    python3-pymongo = [ final.rosPythonPackages.pymongo ];
    python3-pyosmium = [ final.rosPythonPackages.pyosmium ];
    python3-pyparsing = [ final.rosPythonPackages.pyparsing ];
    python3-pyproj = [ final.rosPythonPackages.pyproj ];
    python3-pyqrcode = [ final.rosPythonPackages.pyqrcode ];
    python3-pyqt5.qtwebengine = [ final.rosPythonPackages.pyqtwebengine ];
    python3-pyqtgraph = [ final.rosPythonPackages.pyqtgraph ];
    python3-pystemd = [ final.rosPythonPackages.pystemd ];
    python3-pytest = [ final.rosPythonPackages.pytest ];
    python3-pytest-asyncio = [ final.rosPythonPackages.pytest-asyncio ];
    python3-pytest-cov = [ final.rosPythonPackages.pytestcov ];
    python3-pytest-mock = [ final.rosPythonPackages.pytest-mock ];
    python3-pytest-timeout = [ final.rosPythonPackages.pytest-timeout ];
    python3-qt5-bindings = [
      final.rosPythonPackages.pyside2
      final.rosPythonPackages.pyqt5
      final.rosPythonPackages.sip4
    ];
    python3-qt5-bindings-gl = [ final.rosPythonPackages.pyqt5 ];
    python3-qt5-bindings-webkit = [ final.rosPythonPackages.pyqt5 ];
    python3-qtpy = [ final.rosPythonPackages.qtpy ];
    python3-rdflib = [ final.rosPythonPackages.rdflib ];
    python3-requests = [ final.rosPythonPackages.requests ];
    python3-requests-oauthlib = [ final.rosPythonPackages.requests_oauthlib ];
    python3-retrying = [ final.rosPythonPackages.retrying ];
    python3-rosdistro-modules = [ final.rosPythonPackages.rosdistro ];
    python3-ruamel.yaml = [ final.rosPythonPackages.ruamel_yaml ];
    python3-schedule = [ final.rosPythonPackages.schedule ];
    python3-schema = [ final.rosPythonPackages.schema ];
    python3-scipy = [ final.rosPythonPackages.scipy ];
    python3-selenium = [ final.rosPythonPackages.selenium ];
    python3-semantic-version = [ final.rosPythonPackages.semantic-version ];
    python3-serial = [ final.rosPythonPackages.pyserial ];
    python3-setuptools = [ final.rosPythonPackages.setuptools ];
    python3-sexpdata = [ final.rosPythonPackages.sexpdata ];
    python3-sh = [ final.rosPythonPackages.sh ];
    python3-shapely = [ final.rosPythonPackages.shapely ];
    python3-simplejson = [ final.rosPythonPackages.simplejson ];
    python3-sip = [ final.rosPythonPackages.sip_4 ];
    python3-six = [ final.rosPythonPackages.six ];
    python3-skimage = [ final.rosPythonPackages.scikitimage ];
    python3-sklearn = [ final.rosPythonPackages.scikitlearn ];
    python3-sphinx = [ final.rosPythonPackages.sphinx ];
    python3-sphinx-argparse = [ final.rosPythonPackages.sphinx-argparse ];
    python3-sphinx-rtd-theme = [ final.rosPythonPackages.sphinx_rtd_theme ];
    python3-sqlalchemy = [ final.rosPythonPackages.sqlalchemy ];
    python3-sqlalchemy-utils = [ final.rosPythonPackages.sqlalchemy-utils ];
    python3-sympy = [ final.rosPythonPackages.sympy ];
    python3-systemd = [ final.rosPythonPackages.systemd ];
    python3-tabulate = [ final.rosPythonPackages.tabulate ];
    python3-termcolor = [ final.rosPythonPackages.termcolor ];
    python3-texttable = [ final.rosPythonPackages.texttable ];
    python3-tk = [ final.rosPythonPackages.tkinter ];
    python3-toml = [ final.rosPythonPackages.toml ];
    python3-tornado = [ final.rosPythonPackages.tornado ];
    python3-tqdm = [ final.rosPythonPackages.tqdm ];
    python3-transforms3d = [ final.rosPythonPackages.transforms3d ];
    python3-twilio = [ final.rosPythonPackages.twilio ];
    python3-twisted = [ final.rosPythonPackages.twisted ];
    python3-typeguard = [ final.rosPythonPackages.typeguard ];
    python3-tz = [ final.rosPythonPackages.pytz ];
    python3-unidiff = [ final.rosPythonPackages.unidiff ];
    python3-urllib3 = [ final.rosPythonPackages.urllib3 ];
    python3-usb = [ final.rosPythonPackages.pyusb ];
    python3-vcstool = [ (final.vcstool.override { python3Packages = final.rosPythonPackages; }) ];
    python3-venv = [ final.rosPython ];
    python3-watchdog = [ final.rosPythonPackages.watchdog ];
    python3-webargs = [ final.rosPythonPackages.webargs ];
    python3-websockets = [ final.rosPythonPackages.websockets ];
    python3-whichcraft = [ final.rosPythonPackages.whichcraft ];
    python3-wrapt = [ final.rosPythonPackages.wrapt ];
    python3-xmlschema = [ final.rosPythonPackages.xmlschema ];
    python3-xmltodict = [ final.rosPythonPackages.xmltodict ];
    python3-yaml = [ final.rosPythonPackages.pyyaml ];
    python3-zmq = [ final.rosPythonPackages.pyzmq ];
    qhull-bin = [ final.qhull ];
    qml-module-qt-labs-folderlistmodel = [ final.qt5.qtdeclarative ];
    qml-module-qt-labs-platform = [ final.qt5.qtdeclarative ];
    qml-module-qt-labs-settings = [ final.qt5.qtdeclarative ];
    qml-module-qtcharts = [ final.qt5.qtdeclarative ];
    qml-module-qtgraphicaleffects = [ final.qt5.qtdeclarative ];
    qml-module-qtlocation = [ final.qt5.qtdeclarative ];
    qml-module-qtpositioning = [ final.qt5.qtdeclarative ];
    qml-module-qtquick-controls = [ final.qt5.qtquickcontrols ];
    qml-module-qtquick-controls2 = [ final.qt5.qtquickcontrols2 ];
    qml-module-qtquick-dialogs = [ final.qt5.qtdeclarative ];
    qml-module-qtquick-extras = [ final.qt5.qtdeclarative ];
    qml-module-qtquick-layouts = [ final.qt5.qtdeclarative ];
    qml-module-qtquick-templates2 = [ final.qt5.qtdeclarative ];
    qml-module-qtquick-window2 = [ final.qt5.qtdeclarative ];
    qml-module-qtquick2 = [ final.qt5.qtdeclarative ];
    qrencode = [ final.qrencode ];
    qt5-image-formats-plugins = [ final.qt5.qtimageformats ];
    qt5-qmake = [ final.qt5.qtbase ];
    qtbase5-dev = [ final.qt5.qtbase ];
    qtdeclarative5-dev = [ final.qt5.qtdeclarative ];
    qtmultimedia5-dev = [ final.qt5.qtmultimedia ];
    qtquickcontrols2-5-dev = [ final.qt5.qtquickcontrols2 ];
    qttools5-dev = [ final.qt5.qttools ];
    qttools5-dev-tools = [ final.qt5.qttools.dev ];
    rapidjson-dev = [ final.rapidjson ];
    readline-dev = [ final.readline ];
    recode = [ final.recode ];
    redis-server = [ final.redis ];
    rsync = [ final.rsync ];
    "rti-connext-dds-5.3.1" = [ ];
    "rti-connext-dds-6.0.1" = [ ];
    rtmidi = [ final.rtmidi ];
    ruby = [ final.ruby ];
    sbcl = [ final.sbcl ];
    scons = [ final.scons ];
    screen = [ final.screen ];
    sdformat14 = [ ];
    sdl = [ final.SDL ];
    sdl-gfx = [ final.SDL_gfx ];
    sdl-image = [ final.SDL_image ];
    sdl-mixer = [ final.SDL_mixer ];
    sdl-ttf = [ final.SDL_ttf ];
    sdl2 = [ final.SDL2 ];
    sdl2-ttf = [ final.SDL2_ttf ];
    setserial = [ final.setserial ];
    sfml-dev = [ final.sfml ];
    smartmontools = [ final.smartmontools ];
    smbclient = [ final.samba ];
    snappy = [ final.snappy ];
    socat = [ final.socat ];
    sox = [ final.sox ];
    spacenavd = [ final.spacenavd ];
    sparsehash = [ final.sparsehash ];
    spdlog = [ final.spdlog ];
    speex = [ final.speex ];
    spirv-headers = [ final.spirv-headers ];
    spirv-tools = [ final.spirv-tools ];
    sqlite3 = [ final.sqlite ];
    sshpass = [ final.sshpass ];
    stress = [ final.stress ];
    subversion = [ final.subversion ];
    suitesparse = [ final.suitesparse ];
    swig = [ final.swig ];
    sysstat = [ final.sysstat ];
    tango-icon-theme = [ final.tango-icon-theme ];
    tar = [ final.libtar ];
    tbb = [ final.tbb_2021_11 ];
    tcsh = [ final.tcsh ];
    terminator = [ final.terminator ];
    texmaker = [ final.texmaker ];
    time = [ final.time ];
    tinyxml = [ final.tinyxml ];
    tinyxml2 = [ final.tinyxml-2 ];
    tix = [ final.tix ];
    tmux = [ final.tmux ];
    touchegg = [ final.touchegg ];
    tree = [ final.tree ];
    udev = [ final.udev ];
    uncrustify = [ final.uncrustify ];
    unison = [ final.unison ];
    unoconv = [ final.unoconv ];
    unrar = [ final.unrar ];
    unzip = [ final.unzip ];
    usbutils = [ final.usbutils ];
    util-linux = [ final.util-linux ];
    uuid = [ final.util-linux ];
    uvcdynctrl = [ final.uvcdynctrl ];
    v4l-utils = [ final.v4l-utils ];
    valgrind = [ final.valgrind ];
    vim = [ final.vim ];
    virtualenv = [ final.rosPythonPackages.virtualenv ];
    vlc = [ final.vlc ];
    vorbis-tools = [ final.vorbis-tools ];
    wget = [ final.wget ];
    wireguard = [ final.wireguard-tools ];
    wireless-tools = [ final.wirelesstools ];
    wireshark = [ final.wireshark ];
    wireshark-common = [ final.wireshark-cli ];
    wx-common = [ final.wxGTK32 ];
    wxwidgets = [ final.wxGTK32 ];
    xclip = [ final.xclip ];
    xdg-utils = [ final.xdg-utils ];
    xdotool = [ final.xdotool ];
    xfonts-100dpi = [
      final.xorg.fontadobe100dpi
      final.xorg.fontbh100dpi
      final.xorg.fontbhlucidatypewriter100dpi
      final.xorg.fontbitstream100dpi
    ];
    xfonts-75dpi = [
      final.xorg.fontadobe75dpi
      final.xorg.fontbh75dpi
      final.xorg.fontbhlucidatypewriter75dpi
      final.xorg.fontbitstream75dpi
    ];
    xsimd = [ final.xsimd ];
    xsltproc = [ final.libxslt ];
    xtensor = [ final.xtensor ];
    xterm = [ final.xterm ];
    xvfb = [ final.xorg.xorgserver ];
    yaml = [ final.libyaml ];
    yaml-cpp = [ final.libyamlcpp ];
    yamllint = [ final.yamllint ];
    yapf = [ final.rosPythonPackages.yapf ];
    yapf3 = [ final.rosPythonPackages.yapf ];
    yarn = [ final.yarn ];
    yasm = [ final.yasm ];
    zbar = [ final.zbar ];
    zenity = [ final.gnome.zenity ];
    zeromq3 = [ final.zeromq ];
    zip = [ final.zip ];
    zlib = [ final.zlib ];
    zziplib = [ final.zziplib ];
  });
}
