{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_dashboard_msgs";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."ur_dashboard_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "ur_dashboard_msgs" = substituteSource {
      src = fetchgit {
        name = "ur_dashboard_msgs-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "40f94478562151ada5ce0c744a4ec04337e05394";
        hash = "sha256-a3dNN8HZYkNVIqqmhqnmC5Ovwe+LP/zkfNRKsDCAzew=";
      };
    };
  });
  meta = {
    description = "Messages around the UR Dashboard server.";
  };
})
