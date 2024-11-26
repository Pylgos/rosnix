{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "backward_ros";
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."backward_ros";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libdw-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "backward_ros" = substituteSource {
      src = fetchgit {
        name = "backward_ros-source";
        url = "https://github.com/ros2-gbp/backward_ros-release.git";
        rev = "1e2cf0cd2c8ee82e678a25a91b18983a97e1d5fb";
        hash = "sha256-K7oqrgMSoLx3eFF2IGVngyAI02mWSh7ZbrWEImayhuc=";
      };
    };
  });
  meta = {
    description = "The backward_ros package is a ros wrapper of backward-cpp from https://github.com/bombela/backward-cpp";
  };
})
