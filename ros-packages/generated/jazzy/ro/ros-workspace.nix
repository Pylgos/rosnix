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
  version = "1.0.3-6";
  src = finalAttrs.passthru.sources."ros_workspace";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ament-package ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros_workspace" = substituteSource {
        src = fetchgit {
          name = "ros_workspace-source";
          url = "https://github.com/ros2-gbp/ros_workspace-release.git";
          rev = "7bf5b2dda99e80015f603d80529cf7852471bc39";
          hash = "sha256-+tYPQJjQzjD0UJKtZroIo9VzvGZ6Up1hzFfYxxQKiy0=";
        };
      };
    });
  };
  meta = {
    description = "Provides the prefix level environment files for ROS 2 packages.";
  };
})
