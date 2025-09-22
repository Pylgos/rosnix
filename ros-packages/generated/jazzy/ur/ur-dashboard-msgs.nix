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
  version = "3.4.0-1";
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
        rev = "bb0c4fd3f03ed7623acef695af86920f071dcebf";
        hash = "sha256-jkt50bbDoVokxWS/qHXZ14EuG35RR7OTHvoIlbf6Joc=";
      };
    };
  });
  meta = {
    description = "Messages around the UR Dashboard server.";
  };
})
