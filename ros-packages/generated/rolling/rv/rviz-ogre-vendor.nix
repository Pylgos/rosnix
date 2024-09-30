{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rviz_ogre_vendor" = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "2a7577f98d3e60b0136f6871e5ba260fe7ffef6c";
        hash = "sha256-95DQnpkL5cSkC6FXod+ZogsXePqG29UBGPrjrOjycUM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/OGRECave/ogre.git";
          to = "VCS_TYPE path VCS_URL ${sources."rviz_ogre_vendor/ogre"}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/madler/zlib.git";
          to = "VCS_TYPE path VCS_URL ${sources."rviz_ogre_vendor/zlib"}";
        }
      ];
    };
    "rviz_ogre_vendor/ogre" = substituteSource {
      src = fetchgit {
        name = "ogre-source";
        url = "https://github.com/OGRECave/ogre.git";
        rev = "93d7eb5282d31b956f008a53e837bbb820b34454";
        hash = "sha256-Z0ixdSmkV93coBBVZ5R3lPLfVMXRfWsFz/RsSyqPWFY=";
      };
      substitutions = [
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n            https://download.savannah.gnu.org/releases/freetype/freetype-2.10.1.tar.gz";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/ogre/freetype-2"}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n            https://libsdl.org/release/SDL2-2.0.10.tar.gz";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/ogre/SDL2-2"}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n          https://github.com/assimp/assimp/archive/v5.0.1.tar.gz";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/ogre/v5"}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n        https://github.com/gdraheim/zziplib/archive/v0.13.71.tar.gz";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/ogre/v0"}";
        }
        {
          path = "CMake/Dependencies.cmake";
          from = "DOWNLOAD\n        https://github.com/zeux/pugixml/releases/download/v1.10/pugixml-1.10.tar.gz";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/ogre/pugixml-1"}";
        }
        {
          path = "Components/Overlay/CMakeLists.txt";
          from = "DOWNLOAD\n        https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
          to = "DOWNLOAD file://${sources."rviz_ogre_vendor/ogre/v1"}";
        }
      ];
    };
    "rviz_ogre_vendor/ogre/SDL2-2" = substituteSource {
      src = fetchurl {
        name = "SDL2-2-source";
        url = "https://libsdl.org/release/SDL2-2.0.10.tar.gz";
        hash = "sha256-tGVsE6Hw0AI64vSpzwjskv/7Rk4PJCODN3hBWbi5HVc=";
      };
      substitutions = [
      ];
    };
    "rviz_ogre_vendor/ogre/freetype-2" = substituteSource {
      src = fetchurl {
        name = "freetype-2-source";
        url = "https://download.savannah.gnu.org/releases/freetype/freetype-2.10.1.tar.gz";
        hash = "sha256-OmDTkf1XlEBWG/Dn8xryIivGEK1s5NnXvSFlvKhmkRA=";
      };
      substitutions = [
      ];
    };
    "rviz_ogre_vendor/ogre/pugixml-1" = substituteSource {
      src = fetchurl {
        name = "pugixml-1-source";
        url = "https://github.com/zeux/pugixml/releases/download/v1.10/pugixml-1.10.tar.gz";
        hash = "sha256-VfOZ+7RwlCQQ00hYTclTvK7JJkFdNGL0ce81Dym1hwo=";
      };
      substitutions = [
      ];
    };
    "rviz_ogre_vendor/ogre/v0" = substituteSource {
      src = fetchurl {
        name = "v0-source";
        url = "https://github.com/gdraheim/zziplib/archive/v0.13.71.tar.gz";
        hash = "sha256-LuHg+7t47HzEa95bYoV7xR+NZl3SZVd8+TWENEuLneI=";
      };
      substitutions = [
      ];
    };
    "rviz_ogre_vendor/ogre/v1" = substituteSource {
      src = fetchurl {
        name = "v1-source";
        url = "https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
        hash = "sha256-8ZCFAfbcbbik1XLCklmEf2+IJoSxBIjTqNLaMXRM0KQ=";
      };
      substitutions = [
      ];
    };
    "rviz_ogre_vendor/ogre/v5" = substituteSource {
      src = fetchurl {
        name = "v5-source";
        url = "https://github.com/assimp/assimp/archive/v5.0.1.tar.gz";
        hash = "sha256-ETEOwfKtLNRrlbqI+sqPeqoe/pqhJgXFXj3iuXez2/w=";
      };
      substitutions = [
      ];
    };
    "rviz_ogre_vendor/zlib" = substituteSource {
      src = fetchgit {
        name = "zlib-source";
        url = "https://github.com/madler/zlib.git";
        rev = "09155eaa2f9270dc4ed1fa13e2b4b2613e6e4851";
        hash = "sha256-eUuXV5zfy+fmiMNdWw5QCqDloBkaxy1tgi7by9nYHNA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rviz-ogre-vendor";
  version = "14.2.6-1";
  src = sources."rviz_ogre_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libfreetype-dev" "libfreetype6" "libx11-dev" "libxaw" "libxrandr" "opengl" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around ogre3d, it provides a fixed CMake module and an ExternalProject build of ogre.";
  };
}
