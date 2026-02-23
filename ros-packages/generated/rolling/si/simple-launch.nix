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
  version = "1.11.3-1";
  src = finalAttrs.passthru.sources."simple_launch";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros xacro ];
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "simple_launch" = substituteSource {
      src = fetchgit {
        name = "simple_launch-source";
        url = "https://github.com/ros2-gbp/simple_launch-release.git";
        rev = "3e76ba8c74d1166b9932c5c72aeab92e174856e0";
        hash = "sha256-KUC0cpDWtzDUBhJIf9bzaRF0PJtJzyQM1DmxnmwOfNs=";
      };
    };
  });
  meta = {
    description = "\n    Python helper class for the ROS 2 launch system\n  ";
  };
})
