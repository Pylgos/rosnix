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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."ur_dashboard_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "ur_dashboard_msgs" = substituteSource {
      src = fetchgit {
        name = "ur_dashboard_msgs-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "bec7adb3e60c4e9cd5cdbb852bf814de8884b17a";
        hash = "sha256-L8W2EOWvReYskIm0UFYIYnSMw2DZQf/iOhQpRppEBWA=";
      };
    };
  });
  meta = {
    description = "Messages around the UR Dashboard server.";
  };
})
