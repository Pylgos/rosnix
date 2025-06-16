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
  version = "4.0.2-1";
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
        rev = "7431efe4bf2c8b9827274f8b00b38c4cf16b568b";
        hash = "sha256-Vkb8to77fvNKyGxtP1XMSWsH79CBTmk+2G4O/aCkS1M=";
      };
    };
  });
  meta = {
    description = "Messages around the UR Dashboard server.";
  };
})
