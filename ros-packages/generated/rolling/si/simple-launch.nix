{
  ament-cmake-python,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "simple_launch";
  version = "1.10.1-1";
  src = finalAttrs.passthru.sources."simple_launch";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "simple_launch" = substituteSource {
      src = fetchgit {
        name = "simple_launch-source";
        url = "https://github.com/ros2-gbp/simple_launch-release.git";
        rev = "f48f8e0af3e7f45795f209cbc2b8d403f950c9fe";
        hash = "sha256-qGRcyWgJ5d0NzsUAXpLLeRHBywF3IPhCiLyA5ZOLBqs=";
      };
    };
  });
  meta = {
    description = "Python helper class for the ROS 2 launch system";
  };
})
