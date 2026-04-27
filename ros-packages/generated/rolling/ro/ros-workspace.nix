{
  ament-cmake-core,
  ament-package,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "ros_workspace";
  version = "1.0.3-7";
  src = finalAttrs.passthru.sources."ros_workspace";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ament-package ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-package ];
  passthru.sources = mkSourceSet (sources: {
    "ros_workspace" = substituteSource {
      src = fetchgit {
        name = "ros_workspace-source";
        url = "https://github.com/ros2-gbp/ros_workspace-release.git";
        rev = "b32880ab9aaad7daba1216a74514fee0d6dd2141";
        hash = "sha256-+tYPQJjQzjD0UJKtZroIo9VzvGZ6Up1hzFfYxxQKiy0=";
      };
    };
  });
  meta = {
    description = "\n    Provides the prefix level environment files for ROS 2 packages.\n  ";
  };
})
