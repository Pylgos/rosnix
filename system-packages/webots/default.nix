{
  assimp,
  fetchFromGitHub,
  fetchurl,
  freetype,
  jdk,
  lib,
  libGL,
  libGLU,
  lsb-release,
  ois,
  openal,
  picotts,
  python3,
  qt6Packages,
  stdenv,
  fetchpatch,
  unzip,
  which,
  zip,
  makeBinaryWrapper,
}:

let
  picotts-patched = picotts.overrideAttrs {
    src = fetchFromGitHub {
      owner = "cyberbotics";
      repo = "picotts";
      rev = "470531ab6296a3cb7c83ae5e6ef0db8573b54a8d";
      hash = "sha256-5qMhkaxX2e6M8w7FnYtn5MBrq8pOMgCCbd990i0rhro=";
    };
    postPatch = ''
      for path in lib/*.h; do
        substituteInPlace "$path" --replace-quiet 'this' 'this_'
      done
    '';
  };

  # We need this proprietary shit to build webots
  xc16 = fetchurl {
    url = "https://www.cyberbotics.com/files/repository/dependencies/linux64/release/xc16-1.24.zip";
    hash = "sha256-xXgW1aoO2dosTeUQpPOhywxOFuLZwZFBHQgwAyx2Gu4=";
  };
in

stdenv.mkDerivation (finalAttrs: {
  pname = "webots";
  version = "R2025a";
  src = fetchFromGitHub {
    owner = "cyberbotics";
    repo = "webots";
    rev = finalAttrs.version;
    fetchSubmodules = true;
    hash = "sha256-QVXaBzF1IkkpN67TulE/0ITqYS5d7vts6eWnUiCqDDM=";
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [
    jdk
    lsb-release
    makeBinaryWrapper
    python3
    qt6Packages.qttools # for lrelease and lupdate
    qt6Packages.wrapQtAppsHook
    unzip
    which
    zip
  ];

  buildInputs = [
    assimp
    freetype
    libGL
    libGLU
    ois
    openal
    picotts-patched
    qt6Packages.qtbase
    qt6Packages.qtwebsockets
  ];

  patches = [
    (fetchpatch {
      url = "https://patch-diff.githubusercontent.com/raw/cyberbotics/webots/pull/6794.patch";
      hash = "sha256-Z8svHr28UUVgs01/yorjUlkIbu2K8jM1N1i8HBHaBkY=";
    })
  ];

  postPatch = ''
    patchShebangs .

    echo "release:" > dependencies/Makefile.linux
    substituteInPlace src/webots/Makefile \
      --replace-fail '-lpico' '-lttspico' \
      --replace-fail '-Wl,-rpath $(WEBOTS_LIB_PATH)' '-Wl,-rpath $(out)/lib/webots'
    substituteInPlace resources/translations/Makefile \
      --replace-fail '$(QT_BINARIES_PATH)/lrelease' lrelease \
      --replace-fail '$(QT_BINARIES_PATH)/lupdate' lupdate
    substituteInPlace projects/robots/gctronic/e-puck/transfer/Makefile \
      --replace-fail '@$(WGET) https://www.cyberbotics.com/files/repository/dependencies/$(OS_TAG)/release/$(XC16_PACKAGE)' 'cp ${xc16} xc16-1.24.zip'
    shopt -s globstar
    for path in **/Makefile*; do
      substituteInPlace "$path" \
        --replace-quiet '$(WEBOTS_HOME)/bin/qt/moc' '${qt6Packages.qtbase}/libexec/moc' \
        --replace-quiet '$(WEBOTS_PATH)/bin/qt/moc' '${qt6Packages.qtbase}/libexec/moc'
    done

    for path in src/webots/nodes/utils/*; do
      substituteInPlace "$path" --replace-quiet '#include <OIS/' '#include <ois/'
    done

    # Disable desktop file modification and LD_LIBRARY_PATH modification
    substituteInPlace src/webots/launcher/webots-linux.sh \
        --replace-fail '[ ! -e /usr/share/applications/webots.desktop ]' false \
        --replace-fail '[ -e ~/.local/share/applications/webots-bin.desktop ]' false \
        --replace-fail 'export LD_LIBRARY_PATH="$webots_home/lib/webots":$LD_LIBRARY_PATH' ""
  '';

  installPhase = ''
    mkdir -p "$out/bin"
    cp -a bin/webots-bin "$out/bin"
    cp -a webots webots-controller "$out"
    ln -s "$out/webots" "$out/bin"
    makeBinaryWrapper "$out/webots-controller" "$out/bin/webots-controller" --set-default WEBOTS_HOME "$out"
    mkdir -p "$out/docs"
    cp docs/list.txt "$out/docs"
    mkdir -p "$out/include"
    cp -a include/{controller,ode,plugins} "$out/include"
    cp -a lib "$out"
    cp -a projects "$out"
    cp -a resources "$out"
    ln -s "${picotts-patched}/share/pico" "$out/resources"
    mkdir -p "$out/scripts"
    cp -a scripts/preferences_cleaner "$out/scripts"
    mkdir -p "$out/src/controller"
    cp -a src/controller/{cpp,java,matlab} "$out/src/controller"
    cp .nautilus-metafile.xml "$out"
  '';

  setupHook = ./setup-hook.sh;

  meta = with lib; {
    description = "Webots is an open source and multi-platform desktop application used to simulate robots. It provides a complete development environment to model, program and simulate robots.";
    license = licenses.asl20;
  };
})
