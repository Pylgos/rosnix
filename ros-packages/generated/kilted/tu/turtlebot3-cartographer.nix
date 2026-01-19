{
  ament-cmake,
  buildAmentCmakePackage,
  cartographer-ros,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_cartographer";
  version = "2.3.6-1";
  src = finalAttrs.passthru.sources."turtlebot3_cartographer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cartographer-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cartographer-ros ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_cartographer" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_cartographer-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "a98d71d9873e4972cbc45e57b26ec6d6ca6cd07d";
        hash = "sha256-i2wqDfxUHGCshZfTSJ/jl5dnEiX/b70zyv6d8IRTiXU=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for cartographer\n  ";
  };
})
