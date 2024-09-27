{ lib, config }:
final: prev:
let
  pyForRos =
    {
      jazzy = final.python311; # python3.12 breaks sip4 and pyside2
      iron = final.python310;
      humble = final.python39;
      rolling = final.python311;
    }
    .${config.distro};

in
{
  pythonForRos = pyForRos // {
    pkgs = pyForRos.pkgs.overrideScope (
      pyFinal: pyPrev:
      let
        pkgList =
          (final.poetry2nix.mkPoetryPackages {
            projectDir = ./poetry;
            python = pyForRos;
            overrides = final.poetry2nix.overrides.withDefaults (
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
  pythonForRosPackages = final.pythonForRos.pkgs;

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
    black = [ final.pythonForRosPackages.black ];
    blende = [ final.blender ];
    bluez = [ final.bluez ];
    boost = [ final.pythonForRosPackages.boost ];
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
    cython3 = [ final.pythonForRosPackages.cython ];
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
    ipython3 = [ final.pythonForRosPackages.ipython ];
    iwyu = [ final.include-what-you-use ];
    jack = [ final.jack2 ];
    jasper = [ final.jasper ];
    java = [ final.openjdk ];
    joystick = [ final.linuxConsoleTools ];
    jq = [ final.jq ];
    jupyter-nbconvert = [ final.pythonForRosPackages.nbconvert ];
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
    libboost-atomic = [ final.pythonForRosPackages.boost ];
    libboost-atomic-dev = [ final.pythonForRosPackages.boost ];
    libboost-chrono = [ final.pythonForRosPackages.boost ];
    libboost-chrono-dev = [ final.pythonForRosPackages.boost ];
    libboost-date-time = [ final.pythonForRosPackages.boost ];
    libboost-date-time-dev = [ final.pythonForRosPackages.boost ];
    libboost-dev = [ final.pythonForRosPackages.boost ];
    libboost-filesystem = [ final.pythonForRosPackages.boost ];
    libboost-filesystem-dev = [ final.pythonForRosPackages.boost ];
    libboost-iostreams = [ final.pythonForRosPackages.boost ];
    libboost-iostreams-dev = [ final.pythonForRosPackages.boost ];
    libboost-math = [ final.pythonForRosPackages.boost ];
    libboost-math-dev = [ final.pythonForRosPackages.boost ];
    libboost-numpy-dev = [ final.pythonForRosPackages.boost ];
    libboost-program-options = [ final.pythonForRosPackages.boost ];
    libboost-program-options-dev = [ final.pythonForRosPackages.boost ];
    libboost-python = [ final.pythonForRosPackages.boost ];
    libboost-python-dev = [ final.pythonForRosPackages.boost ];
    libboost-random = [ final.pythonForRosPackages.boost ];
    libboost-random-dev = [ final.pythonForRosPackages.boost ];
    libboost-regex = [ final.pythonForRosPackages.boost ];
    libboost-regex-dev = [ final.pythonForRosPackages.boost ];
    libboost-serialization = [ final.pythonForRosPackages.boost ];
    libboost-serialization-dev = [ final.pythonForRosPackages.boost ];
    libboost-system = [ final.pythonForRosPackages.boost ];
    libboost-system-dev = [ final.pythonForRosPackages.boost ];
    libboost-thread = [ final.pythonForRosPackages.boost ];
    libboost-thread-dev = [ final.pythonForRosPackages.boost ];
    libboost-timer = [ final.pythonForRosPackages.boost ];
    libboost-timer-dev = [ final.pythonForRosPackages.boost ];
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
    pybind11-dev = [ final.pythonForRosPackages.pybind11 ];
    pydocstyle = [ final.pythonForRosPackages.pydocstyle ];
    pyflakes3 = [ final.pythonForRosPackages.pyflakes ];
    python3 = [ final.pythonForRos ];
    python3-alembic = [ final.pythonForRosPackages.alembic ];
    python3-argcomplete = [ final.pythonForRosPackages.argcomplete ];
    python3-autobahn = [ final.pythonForRosPackages.autobahn ];
    python3-bitarray = [ final.pythonForRosPackages.bitarray ];
    python3-boto3 = [ final.pythonForRosPackages.boto3 ];
    python3-bs4 = [ final.pythonForRosPackages.beautifulsoup4 ];
    python3-bson = [ final.pythonForRosPackages.pymongo ];
    python3-cairo = [ final.pythonForRosPackages.pycairo ];
    python3-cairosvg = [ final.pythonForRosPackages.cairosvg ];
    python3-catkin-pkg = [ final.pythonForRosPackages.catkin-pkg ];
    python3-catkin-pkg-modules = [ final.pythonForRosPackages.catkin-pkg ];
    python3-cffi = [ final.pythonForRosPackages.cffi ];
    python3-chainer-pip = [ final.pythonForRosPackages.chainer ];
    python3-cherrypy3 = [ final.pythonForRosPackages.cherrypy ];
    python3-click = [ final.pythonForRosPackages.click ];
    python3-collada = [ final.pythonForRosPackages.pycollada ];
    python3-colorama = [ final.pythonForRosPackages.colorama ];
    python3-construct = [ final.pythonForRosPackages.construct ];
    python3-coverage = [ final.pythonForRosPackages.coverage ];
    python3-crcmod = [ final.pythonForRosPackages.crcmod ];
    python3-cryptography = [ final.pythonForRosPackages.cryptography ];
    python3-dateutil = [ final.pythonForRosPackages.python-dateutil ];
    python3-dbus = [ final.pythonForRosPackages.dbus-python ];
    python3-decorator = [ final.pythonForRosPackages.decorator ];
    python3-defusedxml = [ final.pythonForRosPackages.defusedxml ];
    python3-deprecated = [ final.pythonForRosPackages.deprecated ];
    python3-dev = [ final.pythonForRos ];
    python3-distro = [ final.pythonForRosPackages.distro ];
    python3-distutils = [ final.python3 ];
    python3-docker = [ final.pythonForRosPackages.docker ];
    python3-docopt = [ final.pythonForRosPackages.docopt ];
    python3-docutils = [ final.pythonForRosPackages.docutils ];
    python3-empy = [ final.pythonForRosPackages.empy ];
    python3-ezdxf = [ final.pythonForRosPackages.ezdxf ];
    python3-fiona = [ final.pythonForRosPackages.fiona ];
    python3-flake8 = [ final.pythonForRosPackages.flake8 ];
    python3-flake8-builtins = [ final.pythonForRosPackages.flake8-builtins ];
    python3-flake8-comprehensions = [ final.pythonForRosPackages.flake8-comprehensions ];
    python3-flake8-docstrings = [ final.pythonForRosPackages.flake8-docstrings ];
    python3-flake8-import-order = [ final.pythonForRosPackages.flake8-import-order ];
    python3-flake8-quotes = [ final.pythonForRosPackages.flake8-quotes ];
    python3-flask = [ final.pythonForRosPackages.flask ];
    python3-flask-jwt-extended = [ final.pythonForRosPackages.flask-jwt-extended ];
    python3-future = [ final.pythonForRosPackages.future ];
    python3-geographiclib = [ final.pythonForRosPackages.geographiclib ];
    python3-geopy = [ final.pythonForRosPackages.geopy ];
    python3-gi = [ final.pythonForRosPackages.pygobject3 ];
    python3-gi-cairo = [ final.pythonForRosPackages.pygobject3 ];
    python3-git = [ final.pythonForRosPackages.GitPython ];
    python3-github = [ final.pythonForRosPackages.PyGithub ];
    python3-gnupg = [ final.pythonForRosPackages.python-gnupg ];
    python3-grpc-tools = [ final.pythonForRosPackages.grpcio-tools ];
    python3-grpcio = [ final.pythonForRosPackages.grpcio ];
    python3-h5py = [ final.pythonForRosPackages.h5py ];
    python3-imageio = [ final.pythonForRosPackages.imageio ];
    python3-importlib-metadata = [ final.pythonForRosPackages.importlib-metadata ];
    python3-importlib-resources = [ final.pythonForRosPackages.importlib-resources ];
    python3-interpreter = [ final.python3 ];
    python3-jinja2 = [ final.pythonForRosPackages.jinja2 ];
    python3-jmespath = [ final.pythonForRosPackages.jmespath ];
    python3-joblib = [ final.pythonForRosPackages.joblib ];
    python3-jsonschema = [ final.pythonForRosPackages.jsonschema ];
    python3-kitchen = [ final.pythonForRosPackages.kitchen ];
    python3-lark-parser = [ final.pythonForRosPackages.lark ];
    python3-lockfile = [ final.pythonForRosPackages.lockfile ];
    python3-lxml = [ final.pythonForRosPackages.lxml ];
    python3-mapnik = [ final.pythonForRosPackages.python-mapnik ];
    python3-markdown = [ final.pythonForRosPackages.markdown ];
    python3-matplotlib = [ final.pythonForRosPackages.matplotlib ];
    python3-mechanize = [ final.pythonForRosPackages.mechanize ];
    python3-mock = [ final.pythonForRosPackages.mock ];
    python3-msgpack = [ final.pythonForRosPackages.msgpack ];
    python3-mypy = [ final.pythonForRosPackages.mypy ];
    python3-netcdf4 = [ final.pythonForRosPackages.netcdf4 ];
    python3-netifaces = [ final.pythonForRosPackages.netifaces ];
    python3-networkx = [ final.pythonForRosPackages.networkx ];
    python3-nose = [ final.pythonForRosPackages.nose ];
    python3-numpy = [ final.pythonForRosPackages.numpy ];
    python3-numpy-stl = [ final.pythonForRosPackages.numpy-stl ];
    python3-opencv = [ final.pythonForRosPackages.opencv4 ];
    python3-opengl = [ final.pythonForRosPackages.pyopengl ];
    python3-packaging = [ final.pythonForRosPackages.packaging ];
    python3-pandas = [ final.pythonForRosPackages.pandas ];
    python3-paramiko = [ final.pythonForRosPackages.paramiko ];
    python3-pep8 = [ final.pythonForRosPackages.pep8 ];
    python3-pil = [ final.pythonForRosPackages.pillow ];
    python3-pip = [ final.pythonForRosPackages.pip ];
    python3-pkg-resources = [ final.pythonForRosPackages.setuptools ];
    python3-prettytable = [ final.pythonForRosPackages.prettytable ];
    python3-progressbar = [ final.pythonForRosPackages.progressbar ];
    python3-protobuf = [ final.pythonForRosPackages.protobuf ];
    python3-psutil = [ final.pythonForRosPackages.psutil ];
    python3-pyaudio = [ final.pythonForRosPackages.pyaudio ];
    python3-pyclipper = [ final.pythonForRosPackages.pyclipper ];
    python3-pycodestyle = [ final.pythonForRosPackages.pycodestyle ];
    python3-pycryptodome = [ final.pythonForRosPackages.pycryptodomex ];
    python3-pydot = [ final.pythonForRosPackages.pydot ];
    python3-pygame = [ final.pythonForRosPackages.pygame ];
    python3-pygraphviz = [ final.pythonForRosPackages.pygraphviz ];
    python3-pykdl = [ final.pythonForRosPackages.pykdl ];
    python3-pymongo = [ final.pythonForRosPackages.pymongo ];
    python3-pyosmium = [ final.pythonForRosPackages.pyosmium ];
    python3-pyparsing = [ final.pythonForRosPackages.pyparsing ];
    python3-pyproj = [ final.pythonForRosPackages.pyproj ];
    python3-pyqrcode = [ final.pythonForRosPackages.pyqrcode ];
    python3-pyqt5.qtwebengine = [ final.pythonForRosPackages.pyqtwebengine ];
    python3-pyqtgraph = [ final.pythonForRosPackages.pyqtgraph ];
    python3-pystemd = [ final.pythonForRosPackages.pystemd ];
    python3-pytest = [ final.pythonForRosPackages.pytest ];
    python3-pytest-asyncio = [ final.pythonForRosPackages.pytest-asyncio ];
    python3-pytest-cov = [ final.pythonForRosPackages.pytestcov ];
    python3-pytest-mock = [ final.pythonForRosPackages.pytest-mock ];
    python3-pytest-timeout = [ final.pythonForRosPackages.pytest-timeout ];
    python3-qt5-bindings = [
      final.pythonForRosPackages.pyside2
      final.pythonForRosPackages.pyqt5
      final.pythonForRosPackages.sip4
    ];
    python3-qt5-bindings-gl = [ final.pythonForRosPackages.pyqt5 ];
    python3-qt5-bindings-webkit = [ final.pythonForRosPackages.pyqt5 ];
    python3-qtpy = [ final.pythonForRosPackages.qtpy ];
    python3-rdflib = [ final.pythonForRosPackages.rdflib ];
    python3-requests = [ final.pythonForRosPackages.requests ];
    python3-requests-oauthlib = [ final.pythonForRosPackages.requests_oauthlib ];
    python3-retrying = [ final.pythonForRosPackages.retrying ];
    python3-rosdistro-modules = [ final.pythonForRosPackages.rosdistro ];
    python3-ruamel.yaml = [ final.pythonForRosPackages.ruamel_yaml ];
    python3-schedule = [ final.pythonForRosPackages.schedule ];
    python3-schema = [ final.pythonForRosPackages.schema ];
    python3-scipy = [ final.pythonForRosPackages.scipy ];
    python3-selenium = [ final.pythonForRosPackages.selenium ];
    python3-semantic-version = [ final.pythonForRosPackages.semantic-version ];
    python3-serial = [ final.pythonForRosPackages.pyserial ];
    python3-setuptools = [ final.pythonForRosPackages.setuptools ];
    python3-sexpdata = [ final.pythonForRosPackages.sexpdata ];
    python3-sh = [ final.pythonForRosPackages.sh ];
    python3-shapely = [ final.pythonForRosPackages.shapely ];
    python3-simplejson = [ final.pythonForRosPackages.simplejson ];
    python3-sip = [ final.pythonForRosPackages.sip_4 ];
    python3-six = [ final.pythonForRosPackages.six ];
    python3-skimage = [ final.pythonForRosPackages.scikitimage ];
    python3-sklearn = [ final.pythonForRosPackages.scikitlearn ];
    python3-sphinx = [ final.pythonForRosPackages.sphinx ];
    python3-sphinx-argparse = [ final.pythonForRosPackages.sphinx-argparse ];
    python3-sphinx-rtd-theme = [ final.pythonForRosPackages.sphinx_rtd_theme ];
    python3-sqlalchemy = [ final.pythonForRosPackages.sqlalchemy ];
    python3-sqlalchemy-utils = [ final.pythonForRosPackages.sqlalchemy-utils ];
    python3-sympy = [ final.pythonForRosPackages.sympy ];
    python3-systemd = [ final.pythonForRosPackages.systemd ];
    python3-tabulate = [ final.pythonForRosPackages.tabulate ];
    python3-termcolor = [ final.pythonForRosPackages.termcolor ];
    python3-texttable = [ final.pythonForRosPackages.texttable ];
    python3-tk = [ final.pythonForRosPackages.tkinter ];
    python3-toml = [ final.pythonForRosPackages.toml ];
    python3-tornado = [ final.pythonForRosPackages.tornado ];
    python3-tqdm = [ final.pythonForRosPackages.tqdm ];
    python3-twilio = [ final.pythonForRosPackages.twilio ];
    python3-twisted = [ final.pythonForRosPackages.twisted ];
    python3-tz = [ final.pythonForRosPackages.pytz ];
    python3-unidiff = [ final.pythonForRosPackages.unidiff ];
    python3-urllib3 = [ final.pythonForRosPackages.urllib3 ];
    python3-usb = [ final.pythonForRosPackages.pyusb ];
    python3-vcstool = [ final.vcstool ];
    python3-venv = [ final.python3 ];
    python3-watchdog = [ final.pythonForRosPackages.watchdog ];
    python3-webargs = [ final.pythonForRosPackages.webargs ];
    python3-websockets = [ final.pythonForRosPackages.websockets ];
    python3-whichcraft = [ final.pythonForRosPackages.whichcraft ];
    python3-wrapt = [ final.pythonForRosPackages.wrapt ];
    python3-xmlschema = [ final.pythonForRosPackages.xmlschema ];
    python3-xmltodict = [ final.pythonForRosPackages.xmltodict ];
    python3-yaml = [ final.pythonForRosPackages.pyyaml ];
    python3-zmq = [ final.pythonForRosPackages.pyzmq ];
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
    virtualenv = [ final.pythonForRosPackages.virtualenv ];
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
    yapf = [ final.pythonForRosPackages.yapf ];
    yapf3 = [ final.pythonForRosPackages.yapf ];
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
