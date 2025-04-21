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
  version = "2.2.9-1";
  src = finalAttrs.passthru.sources."turtlebot3_cartographer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cartographer-ros ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_cartographer" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_cartographer-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "669f7a053cab1e81987c61a1f168ffab0a5f5690";
        hash = "sha256-peXFWpGfol1N02vDSK9Tiyr+dBawuHzUsWlg1rjJD/8=";
      };
    };
  });
  meta = {
    description = "ROS 2 launch scripts for cartographer";
  };
})
