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
  version = "0.31.0-1";
  src = finalAttrs.passthru.sources."liblz4_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "liblz4" "liblz4-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "liblz4_vendor" = substituteSource {
      src = fetchgit {
        name = "liblz4_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "fa33b407f44cad873016ab2cd3df19a7c29876f2";
        hash = "sha256-FB1uFR9/9Sw5gTIbZvNsqDI+4nXl9PBjwKPe9wa+VeQ=";
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
