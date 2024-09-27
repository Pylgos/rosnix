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
    gz_ogre_next_vendor-2b91895e6432e73c782f87227d765dce042beb87 = substituteSource {
      src = fetchgit {
        name = "gz_ogre_next_vendor-2b91895e6432e73c782f87227d765dce042beb87-source";
        url = "https://github.com/ros2-gbp/gz_ogre_next_vendor-release.git";
        rev = "2b91895e6432e73c782f87227d765dce042beb87";
        hash = "sha256-BcehX9+MAv7XaPep1PAoEKVFmYHdhyy+9tl5uyE+sFs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/OGRECave/ogre-next.git";
          to = "VCS_TYPE path VCS_URL ${ogre-next-vendor_source-8d4daeaf46d7d8f85f1833f17daedd7dac05daec}";
        }
      ];
    };
    ogre-next-vendor_source-8d4daeaf46d7d8f85f1833f17daedd7dac05daec = substituteSource {
      src = fetchgit {
        name = "ogre-next-vendor_source-8d4daeaf46d7d8f85f1833f17daedd7dac05daec-source";
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
  src = sources.gz_ogre_next_vendor-2b91895e6432e73c782f87227d765dce042beb87;
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
