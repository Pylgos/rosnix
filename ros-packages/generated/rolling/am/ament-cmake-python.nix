{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_python";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_python";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_python" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_python-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "8e555f3e232c30c8d1291e6ad72d978ad1927cc7";
        hash = "sha256-gOjR54PTJWqI8VDVj7kvgBTz4WlKz2Cc2kCTPRCDMMA=";
      };
    };
  });
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
})
