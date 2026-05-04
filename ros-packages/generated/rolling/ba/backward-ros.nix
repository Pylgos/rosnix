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
  version = "1.0.8-4";
  src = finalAttrs.passthru.sources."backward_ros";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libdw-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libdw-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "backward_ros" = substituteSource {
      src = fetchgit {
        name = "backward_ros-source";
        url = "https://github.com/ros2-gbp/backward_ros-release.git";
        rev = "31db4cbf60b9ec50fa3c516b6be942f82c9fb7eb";
        hash = "sha256-Q17GMUdAPL5KPHKgEIIy4B6GTi2lj0om6C3wB6Skmjc=";
      };
    };
  });
  meta = {
    description = "The backward_ros package is a ros wrapper of backward-cpp from https://github.com/bombela/backward-cpp ";
  };
})
