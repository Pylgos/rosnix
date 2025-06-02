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
  version = "2.3.1-1";
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
        rev = "500ce74971730bd8f99fa12af16b3efc2e8ae50a";
        hash = "sha256-N9JNWHh08d8n1eRolpVu+ERIGZLUpQNnKvGRuUY1hj8=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for cartographer\n  ";
  };
})
