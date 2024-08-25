{
  SDL2,
  ament_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  freetype,
  libGL,
  libGLU,
  poco,
  python3Packages,
  rapidjson,
  substituteSource,
  tbb,
  tinyxml-2,
  vulkan-loader,
  xorg,
  zziplib,
}:
let
  sources = rec {
    gz_ogre_next_vendor = substituteSource {
      src = fetchgit {
        name = "gz_ogre_next_vendor-source";
        url = "https://github.com/ros2-gbp/gz_ogre_next_vendor-release.git";
        rev = "2b91895e6432e73c782f87227d765dce042beb87";
        hash = "sha256-BcehX9+MAv7XaPep1PAoEKVFmYHdhyy+9tl5uyE+sFs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/OGRECave/ogre-next.git";
          to = "VCS_TYPE path VCS_URL ${gz_ogre_next_vendor-vendor_source-ogre-next-0}";
        }
      ];
    };
    gz_ogre_next_vendor-vendor_source-ogre-next-0 = substituteSource {
      src = fetchgit {
        name = "gz_ogre_next_vendor-vendor_source-ogre-next-0-source";
        url = "https://github.com/OGRECave/ogre-next.git";
        rev = "8d4daeaf46d7d8f85f1833f17daedd7dac05daec";
        hash = "sha256-elSj35LwsLzj1ssDPsk9NW/KSXfiOGYmw9hQSAWdpFM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ogre_next_vendor";
  version = "0.1.0-1";
  src = sources.gz_ogre_next_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ SDL2 freetype libGL libGLU poco python3Packages.boost rapidjson tbb tinyxml-2 vulkan-loader xorg.libX11 xorg.libXaw xorg.libXrandr zziplib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [ "glslang-dev" "glslc" "libfreeimage-dev" "libshaderc-dev" "libx11-xcb-dev" "libxcb-randr0-dev" ];
  meta = {
    description = "Vendor package for Ogre-next v2.3.3";
  };
}
