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
  version = "2.3.4-1";
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
        rev = "6a9c749aebb048fed1f2f79e4a354572b968b81f";
        hash = "sha256-doDPW6vq+kAl7GwRR/iQIv5TLxSItxuNFGUU/0DM5mk=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for cartographer\n  ";
  };
})
