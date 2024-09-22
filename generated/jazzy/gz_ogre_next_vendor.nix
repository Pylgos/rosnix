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
    gz_ogre_next_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "gz_ogre_next_vendor-source";
        owner = "ros2-gbp";
        repo = "gz_ogre_next_vendor-release";
        rev = "72fb805e4715ba139c8104c830c31a0e3b71c957";
        hash = "sha256-4kfeqp5NoagMC+EqNw8tl7dtjCFunMNruZhuWfzyVow=";
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
      src = fetchFromGitHub {
        name = "gz_ogre_next_vendor-vendor_source-ogre-next-0-source";
        owner = "OGRECave";
        repo = "ogre-next";
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
  version = "0.0.5-1";
  src = sources.gz_ogre_next_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glslang-dev" "glslc" "libboost-date-time-dev" "libboost-dev" "libboost-thread-dev" "libfreeimage-dev" "libfreetype-dev" "libpoco-dev" "libshaderc-dev" "libvulkan-dev" "libx11-dev" "libx11-xcb-dev" "libxaw" "libxcb-randr0-dev" "libxrandr" "opengl" "rapidjson-dev" "sdl2" "tbb" "tinyxml2" "zziplib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for Ogre-next v2.3.3";
  };
}
