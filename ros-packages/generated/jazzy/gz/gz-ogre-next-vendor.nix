{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_ogre_next_vendor";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."gz_ogre_next_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "glslang-dev" "glslc" "libboost-date-time-dev" "libboost-dev" "libboost-thread-dev" "libfreeimage-dev" "libfreetype-dev" "libpoco-dev" "libshaderc-dev" "libvulkan-dev" "libx11-dev" "libx11-xcb-dev" "libxaw" "libxcb-randr0-dev" "libxrandr" "opengl" "rapidjson-dev" "sdl2" "tbb" "tinyxml2" "zziplib" ]; };
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "gz_ogre_next_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_ogre_next_vendor-source";
        url = "https://github.com/ros2-gbp/gz_ogre_next_vendor-release.git";
        rev = "72fb805e4715ba139c8104c830c31a0e3b71c957";
        hash = "sha256-4kfeqp5NoagMC+EqNw8tl7dtjCFunMNruZhuWfzyVow=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/OGRECave/ogre-next.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_ogre_next_vendor/ogre-next"}";
        }
      ];
    };
    "gz_ogre_next_vendor/ogre-next" = substituteSource {
      src = fetchgit {
        name = "ogre-next-source";
        url = "https://github.com/OGRECave/ogre-next.git";
        rev = "8d4daeaf46d7d8f85f1833f17daedd7dac05daec";
        hash = "sha256-elSj35LwsLzj1ssDPsk9NW/KSXfiOGYmw9hQSAWdpFM=";
      };
    };
  });
  meta = {
    description = "Vendor package for Ogre-next v2.3.3";
  };
})
