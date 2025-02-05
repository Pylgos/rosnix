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
  version = "1.0.7-1";
  src = finalAttrs.passthru.sources."backward_ros";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libdw-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "backward_ros" = substituteSource {
      src = fetchgit {
        name = "backward_ros-source";
        url = "https://github.com/ros2-gbp/backward_ros-release.git";
        rev = "cd7f6c6ce4372951e77f76dcc4ca22e75aed108a";
        hash = "sha256-xTghbestQdopaIBolpmuc4lGbg5rOFZcIo3aCQrpLNU=";
      };
    };
  });
  meta = {
    description = "The backward_ros package is a ros wrapper of backward-cpp from https://github.com/bombela/backward-cpp";
  };
})
