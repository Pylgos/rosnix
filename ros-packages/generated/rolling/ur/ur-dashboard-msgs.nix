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
  version = "4.2.0-1";
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
        rev = "ffa262e58b241c79e456077d567cf3bb86d2c96f";
        hash = "sha256-mqQvvoUVceEqlrmxqdPFTz7tjNFtKnvRegfF1VBfD8o=";
      };
    };
  });
  meta = {
    description = "Messages around the UR Dashboard server.";
  };
})
