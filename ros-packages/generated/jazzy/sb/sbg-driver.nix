{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nmea-msgs,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  rtcm-msgs,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sbg_driver";
  version = "3.3.2-1";
  src = finalAttrs.passthru.sources."sbg_driver";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs nmea-msgs rclcpp rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-msgs tf2-ros urdf xacro ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs nmea-msgs rclcpp rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-msgs tf2-ros urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "sbg_driver" = substituteSource {
      src = fetchgit {
        name = "sbg_driver-source";
        url = "https://github.com/SBG-Systems/sbg_ros2-release.git";
        rev = "0e3df513f8adf27dc067fafc3f9acd8f5605b156";
        hash = "sha256-+ZYmlc8kNFaPrS096dWDW++uMWe09K8rMpLNP6Nxp1E=";
      };
    };
  });
  meta = {
    description = "\n    ROS driver package for communication with the SBG navigation systems.\n  ";
  };
})
