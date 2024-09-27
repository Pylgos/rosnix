{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    SDL2-2-vendor_source-0mqxp6w5jhbq6y1j690g9r3gpzwjxh4czaglw8x05l7hl49nqrdl = substituteSource {
      src = fetchurl {
        name = "SDL2-2-vendor_source-0mqxp6w5jhbq6y1j690g9r3gpzwjxh4czaglw8x05l7hl49nqrdl-source";
        url = "https://libsdl.org/release/SDL2-2.0.10.tar.gz";
        hash = "sha256-tGVsE6Hw0AI64vSpzwjskv/7Rk4PJCODN3hBWbi5HVc=";
      };
      substitutions = [
      ];
    };
    freetype-2-vendor_source-044icslbqr91ppbxkr3cml8ccar2y8dg7rzh3db4152pzn8x6q1s = substituteSource {
      src = fetchurl {
        name = "freetype-2-vendor_source-044icslbqr91ppbxkr3cml8ccar2y8dg7rzh3db4152pzn8x6q1s-source";
        url = "https://download.savannah.gnu.org/releases/freetype/freetype-2.10.1.tar.gz";
        hash = "sha256-OmDTkf1XlEBWG/Dn8xryIivGEK1s5NnXvSFlvKhmkRA=";
      };
      substitutions = [
      ];
    };
    freetype2-vendor_source-3f83daeecb1a78d851b660eed025eeba362c0e4a = substituteSource {
      src = fetchgit {
        name = "freetype2-vendor_source-3f83daeecb1a78d851b660eed025eeba362c0e4a-source";
        url = "https://git.savannah.gnu.org/git/freetype/freetype2.git";
        rev = "3f83daeecb1a78d851b660eed025eeba362c0e4a";
        hash = "sha256-UEn5Renp7EK9hTNRLiV7sec70zvY8mrLRwJoZ6aUJEE=";
      };
      substitutions = [
      ];
    };
    ogre-vendor_source-93d7eb5282d31b956f008a53e837bbb820b34454 = substituteSource {
      src = fetchgit {
        name = "ogre-vendor_source-93d7eb5282d31b956f008a53e837bbb820b34454-source";
        url = "https://github.com/OGRECave/ogre.git";
        rev = "93d7eb5282d31b956f008a53e837bbb820b34454";
        hash = "sha256-Z0ixdSmkV93coBBVZ5R3lPLfVMXRfWsFz/RsSyqPWFY=";
      };
      substitutions = [
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n            https://download.savannah.gnu.org/releases/freetype/freetype-2.10.1.tar.gz";
          to = "DOWNLOAD file://${freetype-2-vendor_source-044icslbqr91ppbxkr3cml8ccar2y8dg7rzh3db4152pzn8x6q1s}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n            https://libsdl.org/release/SDL2-2.0.10.tar.gz";
          to = "DOWNLOAD file://${SDL2-2-vendor_source-0mqxp6w5jhbq6y1j690g9r3gpzwjxh4czaglw8x05l7hl49nqrdl}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n          https://github.com/assimp/assimp/archive/v5.0.1.tar.gz";
          to = "DOWNLOAD file://${v5-vendor_source-1z6vndvvkqixbv2ha9m1kbz1xaksiz5gm25sjmmx8b5dyb0hwc8i}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n        https://github.com/gdraheim/zziplib/archive/v0.13.71.tar.gz";
          to = "DOWNLOAD file://${v0-vendor_source-1qlxid5k911mz5y5frfjbmk8s7y5gf2n4nyydg27rv3qpgxy1q9f}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n        https://github.com/zeux/pugixml/releases/download/v1.10/pugixml-1.10.tar.gz";
          to = "DOWNLOAD file://${pugixml-1-vendor_source-02l7nllhydggf7s64d2x84kckbmwag4lsn28sc82953hnkxrkwsm}";
        }
        {
          path = "Components/Overlay/CMakeLists.txt";
          from = "DOWNLOAD\n        https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
          to = "DOWNLOAD file://${v1-vendor_source-196h9is33nnjm39qh15ihhk8hvvzhicr5hkjsnjbhvfwyq0qb47i}";
        }
      ];
    };
    pugixml-1-vendor_source-02l7nllhydggf7s64d2x84kckbmwag4lsn28sc82953hnkxrkwsm = substituteSource {
      src = fetchurl {
        name = "pugixml-1-vendor_source-02l7nllhydggf7s64d2x84kckbmwag4lsn28sc82953hnkxrkwsm-source";
        url = "https://github.com/zeux/pugixml/releases/download/v1.10/pugixml-1.10.tar.gz";
        hash = "sha256-VfOZ+7RwlCQQ00hYTclTvK7JJkFdNGL0ce81Dym1hwo=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-4dce8d185f7d2ca469b128b364618c2a470fa0af = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-4dce8d185f7d2ca469b128b364618c2a470fa0af-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "4dce8d185f7d2ca469b128b364618c2a470fa0af";
        hash = "sha256-FyCjQ73rS4w37i7nrbHeK/RdHTb78dzsUCdzp/0dZ2E=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://git.savannah.gnu.org/git/freetype/freetype2.git";
          to = "VCS_TYPE path VCS_URL ${freetype2-vendor_source-3f83daeecb1a78d851b660eed025eeba362c0e4a}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/OGRECave/ogre.git";
          to = "VCS_TYPE path VCS_URL ${ogre-vendor_source-93d7eb5282d31b956f008a53e837bbb820b34454}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/madler/zlib.git";
          to = "VCS_TYPE path VCS_URL ${zlib-vendor_source-09155eaa2f9270dc4ed1fa13e2b4b2613e6e4851}";
        }
      ];
    };
    v0-vendor_source-1qlxid5k911mz5y5frfjbmk8s7y5gf2n4nyydg27rv3qpgxy1q9f = substituteSource {
      src = fetchurl {
        name = "v0-vendor_source-1qlxid5k911mz5y5frfjbmk8s7y5gf2n4nyydg27rv3qpgxy1q9f-source";
        url = "https://github.com/gdraheim/zziplib/archive/v0.13.71.tar.gz";
        hash = "sha256-LuHg+7t47HzEa95bYoV7xR+NZl3SZVd8+TWENEuLneI=";
      };
      substitutions = [
      ];
    };
    v1-vendor_source-196h9is33nnjm39qh15ihhk8hvvzhicr5hkjsnjbhvfwyq0qb47i = substituteSource {
      src = fetchurl {
        name = "v1-vendor_source-196h9is33nnjm39qh15ihhk8hvvzhicr5hkjsnjbhvfwyq0qb47i-source";
        url = "https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
        hash = "sha256-8ZCFAfbcbbik1XLCklmEf2+IJoSxBIjTqNLaMXRM0KQ=";
      };
      substitutions = [
      ];
    };
    v5-vendor_source-1z6vndvvkqixbv2ha9m1kbz1xaksiz5gm25sjmmx8b5dyb0hwc8i = substituteSource {
      src = fetchurl {
        name = "v5-vendor_source-1z6vndvvkqixbv2ha9m1kbz1xaksiz5gm25sjmmx8b5dyb0hwc8i-source";
        url = "https://github.com/assimp/assimp/archive/v5.0.1.tar.gz";
        hash = "sha256-ETEOwfKtLNRrlbqI+sqPeqoe/pqhJgXFXj3iuXez2/w=";
      };
      substitutions = [
      ];
    };
    zlib-vendor_source-09155eaa2f9270dc4ed1fa13e2b4b2613e6e4851 = substituteSource {
      src = fetchgit {
        name = "zlib-vendor_source-09155eaa2f9270dc4ed1fa13e2b4b2613e6e4851-source";
        url = "https://github.com/madler/zlib.git";
        rev = "09155eaa2f9270dc4ed1fa13e2b4b2613e6e4851";
        hash = "sha256-eUuXV5zfy+fmiMNdWw5QCqDloBkaxy1tgi7by9nYHNA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_ogre_vendor";
  version = "14.1.5-1";
  src = sources.rviz_ogre_vendor-4dce8d185f7d2ca469b128b364618c2a470fa0af;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libfreetype-dev" "libfreetype6" "libx11-dev" "libxaw" "libxrandr" "opengl" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around ogre3d, it provides a fixed CMake module and an ExternalProject build of ogre.";
  };
}
