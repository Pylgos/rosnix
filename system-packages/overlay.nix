{ lib, config }:
final: prev:
let
  prevPython3 =
    {
      # jazzy = prev.python312;
      jazzy = prev.python311; # python3.12 breaks sip4 and pyside2
      iron = prev.python310;
      humble = prev.python39;
      rolling = prev.python311;
    }
    .${config.distro};
in
{
  python3 = prevPython3 // {
    pkgs = prevPython3.pkgs.overrideScope (
      pyFinal: pyPrev:
      let
        pkgList =
          (prev.poetry2nix.mkPoetryPackages {
            projectDir = ../poetry;
            python = prevPython3;
            overrides = prev.poetry2nix.overrides.withDefaults (
              final: prev: {
                inherit (pyFinal) docutils flake8;
                flake8-builtins = prev.flake8-builtins.overridePythonAttrs (oldAttras: {
                  nativeBuildInputs = oldAttras.nativeBuildInputs ++ [ final.hatchling ];
                });
              }
            );
          }).poetryPackages;
        pkgsByNames = lib.listToAttrs (
          map (drv: {
            name = drv.pname;
            value = drv;
          }) pkgList
        );
      in
      {
        inherit (pkgsByNames)
          rosdistro
          catkin-pkg
          flake8-quotes
          flake8-comprehensions
          flake8-builtins
          colcon-common-extensions
          empy
          ;
      }
    );
  };
  python3Packages = final.python3.pkgs;

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
    black = [ final.python3Packages.black ];
    blende = [ final.blender ];
    bluez = [ final.bluez ];
    boost = [ final.python3Packages.boost ];
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
    cmake = [ final.cmake ];
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
    cython3 = [ final.python3Packages.cython ];
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
    ipython3 = [ final.python3Packages.ipython ];
    iwyu = [ final.include-what-you-use ];
    jack = [ final.jack2 ];
    jasper = [ final.jasper ];
    java = [ final.openjdk ];
    joystick = [ final.linuxConsoleTools ];
    jq = [ final.jq ];
    jupyter-nbconvert = [ final.python3Packages.nbconvert ];
    jupyter-notebook = [ final.jupyter ];
    jython = [ final.jython ];
    kakasi = [ final.kakasi ];
    kate = [ final.plasma5Packages.kate ];
    kgraphviewer = [ final.kgraphviewer ];
    konsole = [ final.plasma5Packages.konsole ];
    lcov = [ final.lcov ];
    leveldb = [ final.leveldb ];
    libabsl-dev = [ final.abseil-cpp_202206 ];
    libasound2-dev = [ final.alsaLib ];
    libatomic = [ ];
    libavahi-client-dev = [ final.avahi ];
    libavahi-core-dev = [ final.avahi ];
    libb64-dev = [ final.libb64 ];
    libbison-dev = [ final.bison ];
    libblas-dev = [ final.blas ];
    libbluetooth = [ final.bluez ];
    libbluetooth-dev = [ final.bluez ];
    libboost-atomic = [ final.python3Packages.boost ];
    libboost-atomic-dev = [ final.python3Packages.boost ];
    libboost-chrono = [ final.python3Packages.boost ];
    libboost-chrono-dev = [ final.python3Packages.boost ];
    libboost-date-time = [ final.python3Packages.boost ];
    libboost-date-time-dev = [ final.python3Packages.boost ];
    libboost-dev = [ final.python3Packages.boost ];
    libboost-filesystem = [ final.python3Packages.boost ];
    libboost-filesystem-dev = [ final.python3Packages.boost ];
    libboost-iostreams = [ final.python3Packages.boost ];
    libboost-iostreams-dev = [ final.python3Packages.boost ];
    libboost-math = [ final.python3Packages.boost ];
    libboost-math-dev = [ final.python3Packages.boost ];
    libboost-numpy-dev = [ final.python3Packages.boost ];
    libboost-program-options = [ final.python3Packages.boost ];
    libboost-program-options-dev = [ final.python3Packages.boost ];
    libboost-python = [ final.python3Packages.boost ];
    libboost-python-dev = [ final.python3Packages.boost ];
    libboost-random = [ final.python3Packages.boost ];
    libboost-random-dev = [ final.python3Packages.boost ];
    libboost-regex = [ final.python3Packages.boost ];
    libboost-regex-dev = [ final.python3Packages.boost ];
    libboost-serialization = [ final.python3Packages.boost ];
    libboost-serialization-dev = [ final.python3Packages.boost ];
    libboost-system = [ final.python3Packages.boost ];
    libboost-system-dev = [ final.python3Packages.boost ];
    libboost-thread = [ final.python3Packages.boost ];
    libboost-thread-dev = [ final.python3Packages.boost ];
    libboost-timer = [ final.python3Packages.boost ];
    libboost-timer-dev = [ final.python3Packages.boost ];
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
    protobuf = [ final.protobuf_21 ];
    protobuf-dev = [ final.protobuf_21 ];
    pstoedit = [ final.pstoedit ];
    psutils = [ final.psutils ];
    pugixml-dev = [ final.pugixml ];
    pybind11-dev = [ final.python3Packages.pybind11 ];
    pydocstyle = [ final.python3Packages.pydocstyle ];
    pyflakes3 = [ final.python3Packages.pyflakes ];
    python3 = [ final.python3 ];
    python3-alembic = [ final.python3Packages.alembic ];
    python3-argcomplete = [ final.python3Packages.argcomplete ];
    python3-autobahn = [ final.python3Packages.autobahn ];
    python3-bitarray = [ final.python3Packages.bitarray ];
    python3-boto3 = [ final.python3Packages.boto3 ];
    python3-bs4 = [ final.python3Packages.beautifulsoup4 ];
    python3-bson = [ final.python3Packages.pymongo ];
    python3-cairo = [ final.python3Packages.pycairo ];
    python3-cairosvg = [ final.python3Packages.cairosvg ];
    python3-catkin-pkg = [ final.python3Packages.catkin-pkg ];
    python3-catkin-pkg-modules = [ final.python3Packages.catkin-pkg ];
    python3-cffi = [ final.python3Packages.cffi ];
    python3-chainer-pip = [ final.python3Packages.chainer ];
    python3-cherrypy3 = [ final.python3Packages.cherrypy ];
    python3-click = [ final.python3Packages.click ];
    python3-collada = [ final.python3Packages.pycollada ];
    python3-colorama = [ final.python3Packages.colorama ];
    python3-construct = [ final.python3Packages.construct ];
    python3-coverage = [ final.python3Packages.coverage ];
    python3-crcmod = [ final.python3Packages.crcmod ];
    python3-cryptography = [ final.python3Packages.cryptography ];
    python3-dateutil = [ final.python3Packages.python-dateutil ];
    python3-dbus = [ final.python3Packages.dbus-python ];
    python3-decorator = [ final.python3Packages.decorator ];
    python3-defusedxml = [ final.python3Packages.defusedxml ];
    python3-deprecated = [ final.python3Packages.deprecated ];
    python3-dev = [ final.python3 ];
    python3-distro = [ final.python3Packages.distro ];
    python3-distutils = [ final.python3 ];
    python3-docker = [ final.python3Packages.docker ];
    python3-docopt = [ final.python3Packages.docopt ];
    python3-docutils = [ final.python3Packages.docutils ];
    python3-empy = [ final.python3Packages.empy ];
    python3-ezdxf = [ final.python3Packages.ezdxf ];
    python3-fiona = [ final.python3Packages.fiona ];
    python3-flake8 = [ final.python3Packages.flake8 ];
    python3-flake8-builtins = [ final.python3Packages.flake8-builtins ];
    python3-flake8-comprehensions = [ final.python3Packages.flake8-comprehensions ];
    python3-flake8-docstrings = [ final.python3Packages.flake8-docstrings ];
    python3-flake8-import-order = [ final.python3Packages.flake8-import-order ];
    python3-flake8-quotes = [ final.python3Packages.flake8-quotes ];
    python3-flask = [ final.python3Packages.flask ];
    python3-flask-jwt-extended = [ final.python3Packages.flask-jwt-extended ];
    python3-future = [ final.python3Packages.future ];
    python3-geographiclib = [ final.python3Packages.geographiclib ];
    python3-geopy = [ final.python3Packages.geopy ];
    python3-gi = [ final.python3Packages.pygobject3 ];
    python3-gi-cairo = [ final.python3Packages.pygobject3 ];
    python3-git = [ final.python3Packages.GitPython ];
    python3-github = [ final.python3Packages.PyGithub ];
    python3-gnupg = [ final.python3Packages.python-gnupg ];
    python3-grpc-tools = [ final.python3Packages.grpcio-tools ];
    python3-grpcio = [ final.python3Packages.grpcio ];
    python3-h5py = [ final.python3Packages.h5py ];
    python3-imageio = [ final.python3Packages.imageio ];
    python3-importlib-metadata = [ final.python3Packages.importlib-metadata ];
    python3-importlib-resources = [ final.python3Packages.importlib-resources ];
    python3-interpreter = [ final.python3 ];
    python3-jinja2 = [ final.python3Packages.jinja2 ];
    python3-jmespath = [ final.python3Packages.jmespath ];
    python3-joblib = [ final.python3Packages.joblib ];
    python3-jsonschema = [ final.python3Packages.jsonschema ];
    python3-kitchen = [ final.python3Packages.kitchen ];
    python3-lark-parser = [ final.python3Packages.lark ];
    python3-lockfile = [ final.python3Packages.lockfile ];
    python3-lxml = [ final.python3Packages.lxml ];
    python3-mapnik = [ final.python3Packages.python-mapnik ];
    python3-markdown = [ final.python3Packages.markdown ];
    python3-matplotlib = [ final.python3Packages.matplotlib ];
    python3-mechanize = [ final.python3Packages.mechanize ];
    python3-mock = [ final.python3Packages.mock ];
    python3-msgpack = [ final.python3Packages.msgpack ];
    python3-mypy = [ final.python3Packages.mypy ];
    python3-netcdf4 = [ final.python3Packages.netcdf4 ];
    python3-netifaces = [ final.python3Packages.netifaces ];
    python3-networkx = [ final.python3Packages.networkx ];
    python3-nose = [ final.python3Packages.nose ];
    python3-numpy = [ final.python3Packages.numpy ];
    python3-numpy-stl = [ final.python3Packages.numpy-stl ];
    python3-opencv = [ final.python3Packages.opencv4 ];
    python3-opengl = [ final.python3Packages.pyopengl ];
    python3-packaging = [ final.python3Packages.packaging ];
    python3-pandas = [ final.python3Packages.pandas ];
    python3-paramiko = [ final.python3Packages.paramiko ];
    python3-pep8 = [ final.python3Packages.pep8 ];
    python3-pil = [ final.python3Packages.pillow ];
    python3-pip = [ final.python3Packages.pip ];
    python3-pkg-resources = [ final.python3Packages.setuptools ];
    python3-prettytable = [ final.python3Packages.prettytable ];
    python3-progressbar = [ final.python3Packages.progressbar ];
    python3-protobuf = [ final.python3Packages.protobuf ];
    python3-psutil = [ final.python3Packages.psutil ];
    python3-pyaudio = [ final.python3Packages.pyaudio ];
    python3-pyclipper = [ final.python3Packages.pyclipper ];
    python3-pycodestyle = [ final.python3Packages.pycodestyle ];
    python3-pycryptodome = [ final.python3Packages.pycryptodomex ];
    python3-pydot = [ final.python3Packages.pydot ];
    python3-pygame = [ final.python3Packages.pygame ];
    python3-pygraphviz = [ final.python3Packages.pygraphviz ];
    python3-pykdl = [ final.python3Packages.pykdl ];
    python3-pymongo = [ final.python3Packages.pymongo ];
    python3-pyosmium = [ final.python3Packages.pyosmium ];
    python3-pyparsing = [ final.python3Packages.pyparsing ];
    python3-pyproj = [ final.python3Packages.pyproj ];
    python3-pyqrcode = [ final.python3Packages.pyqrcode ];
    python3-pyqt5.qtwebengine = [ final.python3Packages.pyqtwebengine ];
    python3-pyqtgraph = [ final.python3Packages.pyqtgraph ];
    python3-pystemd = [ final.python3Packages.pystemd ];
    python3-pytest = [ final.python3Packages.pytest ];
    python3-pytest-asyncio = [ final.python3Packages.pytest-asyncio ];
    python3-pytest-cov = [ final.python3Packages.pytestcov ];
    python3-pytest-mock = [ final.python3Packages.pytest-mock ];
    python3-pytest-timeout = [ final.python3Packages.pytest-timeout ];
    python3-qt5-bindings = [
      final.python3Packages.pyside2
      final.python3Packages.pyqt5
      final.python3Packages.sip4
    ];
    python3-qt5-bindings-gl = [ final.python3Packages.pyqt5 ];
    python3-qt5-bindings-webkit = [ final.python3Packages.pyqt5 ];
    python3-qtpy = [ final.python3Packages.qtpy ];
    python3-rdflib = [ final.python3Packages.rdflib ];
    python3-requests = [ final.python3Packages.requests ];
    python3-requests-oauthlib = [ final.python3Packages.requests_oauthlib ];
    python3-retrying = [ final.python3Packages.retrying ];
    python3-rosdistro-modules = [ final.python3Packages.rosdistro ];
    python3-ruamel.yaml = [ final.python3Packages.ruamel_yaml ];
    python3-schedule = [ final.python3Packages.schedule ];
    python3-schema = [ final.python3Packages.schema ];
    python3-scipy = [ final.python3Packages.scipy ];
    python3-selenium = [ final.python3Packages.selenium ];
    python3-semantic-version = [ final.python3Packages.semantic-version ];
    python3-serial = [ final.python3Packages.pyserial ];
    python3-setuptools = [ final.python3Packages.setuptools ];
    python3-sexpdata = [ final.python3Packages.sexpdata ];
    python3-sh = [ final.python3Packages.sh ];
    python3-shapely = [ final.python3Packages.shapely ];
    python3-simplejson = [ final.python3Packages.simplejson ];
    python3-sip = [ final.python3Packages.sip_4 ];
    python3-six = [ final.python3Packages.six ];
    python3-skimage = [ final.python3Packages.scikitimage ];
    python3-sklearn = [ final.python3Packages.scikitlearn ];
    python3-sphinx = [ final.python3Packages.sphinx ];
    python3-sphinx-argparse = [ final.python3Packages.sphinx-argparse ];
    python3-sphinx-rtd-theme = [ final.python3Packages.sphinx_rtd_theme ];
    python3-sqlalchemy = [ final.python3Packages.sqlalchemy ];
    python3-sqlalchemy-utils = [ final.python3Packages.sqlalchemy-utils ];
    python3-sympy = [ final.python3Packages.sympy ];
    python3-systemd = [ final.python3Packages.systemd ];
    python3-tabulate = [ final.python3Packages.tabulate ];
    python3-termcolor = [ final.python3Packages.termcolor ];
    python3-texttable = [ final.python3Packages.texttable ];
    python3-tk = [ final.python3Packages.tkinter ];
    python3-toml = [ final.python3Packages.toml ];
    python3-tornado = [ final.python3Packages.tornado ];
    python3-tqdm = [ final.python3Packages.tqdm ];
    python3-twilio = [ final.python3Packages.twilio ];
    python3-twisted = [ final.python3Packages.twisted ];
    python3-tz = [ final.python3Packages.pytz ];
    python3-unidiff = [ final.python3Packages.unidiff ];
    python3-urllib3 = [ final.python3Packages.urllib3 ];
    python3-usb = [ final.python3Packages.pyusb ];
    python3-vcstool = [ final.vcstool ];
    python3-venv = [ final.python3 ];
    python3-watchdog = [ final.python3Packages.watchdog ];
    python3-webargs = [ final.python3Packages.webargs ];
    python3-websockets = [ final.python3Packages.websockets ];
    python3-whichcraft = [ final.python3Packages.whichcraft ];
    python3-wrapt = [ final.python3Packages.wrapt ];
    python3-xmlschema = [ final.python3Packages.xmlschema ];
    python3-xmltodict = [ final.python3Packages.xmltodict ];
    python3-yaml = [ final.python3Packages.pyyaml ];
    python3-zmq = [ final.python3Packages.pyzmq ];
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
    virtualenv = [ final.python3Packages.virtualenv ];
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
    xtensor = [ final.xtensor ];
    xsltproc = [ final.libxslt ];
    xterm = [ final.xterm ];
    xvfb = [ final.xorg.xorgserver ];
    yaml = [ final.libyaml ];
    yaml-cpp = [ final.libyamlcpp ];
    yamllint = [ final.yamllint ];
    yapf = [ final.python3Packages.yapf ];
    yapf3 = [ final.python3Packages.yapf ];
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