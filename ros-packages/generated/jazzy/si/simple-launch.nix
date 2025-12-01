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
  version = "1.11.1-1";
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
        rev = "c5ae96881fd362d73111227cd001b76b8b229b7a";
        hash = "sha256-W1pVLzM7AWwZcw7LwSGSCgJ/I7sOG7mcFCUehygKHA4=";
      };
    };
  });
  meta = {
    description = "\n    Python helper class for the ROS 2 launch system\n  ";
  };
})
