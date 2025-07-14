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
  version = "2.3.2-1";
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
        rev = "5033b7b593319187b875ee1c050b41ca7a9277fe";
        hash = "sha256-V8MuWJzaBlO509P8ly/gC13zApfd5VLPvpoDrzKC9m0=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for cartographer\n  ";
  };
})
