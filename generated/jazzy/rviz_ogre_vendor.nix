{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rviz_ogre_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "rviz_ogre_vendor-source";
        owner = "ros2-gbp";
        repo = "rviz-release";
        rev = "4dce8d185f7d2ca469b128b364618c2a470fa0af";
        hash = "sha256-FyCjQ73rS4w37i7nrbHeK/RdHTb78dzsUCdzp/0dZ2E=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://git.savannah.gnu.org/git/freetype/freetype2.git";
          to = "VCS_TYPE path VCS_URL ${rviz_ogre_vendor-vendor_source-freetype2-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/OGRECave/ogre.git";
          to = "VCS_TYPE path VCS_URL ${rviz_ogre_vendor-vendor_source-ogre-2}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/madler/zlib.git";
          to = "VCS_TYPE path VCS_URL ${rviz_ogre_vendor-vendor_source-zlib-1}";
        }
      ];
    };
    rviz_ogre_vendor-vendor_source-freetype2-0 = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-vendor_source-freetype2-0-source";
        url = "https://git.savannah.gnu.org/git/freetype/freetype2.git";
        rev = "3f83daeecb1a78d851b660eed025eeba362c0e4a";
        hash = "sha256-UEn5Renp7EK9hTNRLiV7sec70zvY8mrLRwJoZ6aUJEE=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-ogre-2 = substituteSource {
      src = fetchFromGitHub {
        name = "rviz_ogre_vendor-vendor_source-ogre-2-source";
        owner = "OGRECave";
        repo = "ogre";
        rev = "93d7eb5282d31b956f008a53e837bbb820b34454";
        hash = "sha256-Z0ixdSmkV93coBBVZ5R3lPLfVMXRfWsFz/RsSyqPWFY=";
      };
      substitutions = [
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n            https://download.savannah.gnu.org/releases/freetype/freetype-2.10.1.tar.gz";
          to = "DOWNLOAD file://${rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-freetype-2-2}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n            https://libsdl.org/release/SDL2-2.0.10.tar.gz";
          to = "DOWNLOAD file://${rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-SDL2-2-2}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n          https://github.com/assimp/assimp/archive/v5.0.1.tar.gz";
          to = "DOWNLOAD file://${rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v5-2}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n        https://github.com/gdraheim/zziplib/archive/v0.13.71.tar.gz";
          to = "DOWNLOAD file://${rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v0-2}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n        https://github.com/zeux/pugixml/releases/download/v1.10/pugixml-1.10.tar.gz";
          to = "DOWNLOAD file://${rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-pugixml-1-2}";
        }
        {
          path = "Components/Overlay/CMakeLists.txt";
          from = "DOWNLOAD\n        https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
          to = "DOWNLOAD file://${rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v1-2}";
        }
      ];
    };
    rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-SDL2-2-2 = substituteSource {
      src = fetchurl {
        name = "rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-SDL2-2-2-source";
        url = "https://libsdl.org/release/SDL2-2.0.10.tar.gz";
        hash = "sha256-tGVsE6Hw0AI64vSpzwjskv/7Rk4PJCODN3hBWbi5HVc=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-freetype-2-2 = substituteSource {
      src = fetchurl {
        name = "rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-freetype-2-2-source";
        url = "https://download.savannah.gnu.org/releases/freetype/freetype-2.10.1.tar.gz";
        hash = "sha256-OmDTkf1XlEBWG/Dn8xryIivGEK1s5NnXvSFlvKhmkRA=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-pugixml-1-2 = substituteSource {
      src = fetchurl {
        name = "rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-pugixml-1-2-source";
        url = "https://github.com/zeux/pugixml/releases/download/v1.10/pugixml-1.10.tar.gz";
        hash = "sha256-VfOZ+7RwlCQQ00hYTclTvK7JJkFdNGL0ce81Dym1hwo=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v0-2 = substituteSource {
      src = fetchurl {
        name = "rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v0-2-source";
        url = "https://github.com/gdraheim/zziplib/archive/v0.13.71.tar.gz";
        hash = "sha256-LuHg+7t47HzEa95bYoV7xR+NZl3SZVd8+TWENEuLneI=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v1-2 = substituteSource {
      src = fetchurl {
        name = "rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v1-2-source";
        url = "https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
        hash = "sha256-8ZCFAfbcbbik1XLCklmEf2+IJoSxBIjTqNLaMXRM0KQ=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v5-2 = substituteSource {
      src = fetchurl {
        name = "rviz_ogre_vendor-vendor_source-ogre-2-vendor_source-v5-2-source";
        url = "https://github.com/assimp/assimp/archive/v5.0.1.tar.gz";
        hash = "sha256-ETEOwfKtLNRrlbqI+sqPeqoe/pqhJgXFXj3iuXez2/w=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-zlib-1 = substituteSource {
      src = fetchFromGitHub {
        name = "rviz_ogre_vendor-vendor_source-zlib-1-source";
        owner = "madler";
        repo = "zlib";
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
  src = sources.rviz_ogre_vendor;
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
