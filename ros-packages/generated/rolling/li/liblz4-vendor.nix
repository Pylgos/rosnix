{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "liblz4_vendor";
  version = "0.33.0-1";
  src = finalAttrs.passthru.sources."liblz4_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "liblz4" "liblz4-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "liblz4" "liblz4-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "liblz4_vendor" = substituteSource {
      src = fetchgit {
        name = "liblz4_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "3f7ccebe744e1a07d02ba719179f6bff8754a61e";
        hash = "sha256-f/PC/id3Apt2l6TJjrWm+ADMCyfZiW0idOOomjtxOA8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/lz4/lz4.git";
          to = "VCS_TYPE path VCS_URL ${sources."liblz4_vendor/lz4"}";
        }
      ];
    };
    "liblz4_vendor/lz4" = substituteSource {
      src = fetchgit {
        name = "lz4-source";
        url = "https://github.com/lz4/lz4.git";
        rev = "5ff839680134437dbf4678f3d0c7b371d84f4964";
        hash = "sha256-YiMCD3vvrG+oxBUghSrCmP2LAfAGZrEaKz0YoaQJhpI=";
      };
    };
  });
  meta = {
    description = "LZ4 compression vendor package, providing a dependency for LZ4.";
  };
})
