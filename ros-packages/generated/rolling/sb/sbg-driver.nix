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
        rev = "596d5ddd14b476e2a938de058b9f66edf712afc5";
        hash = "sha256-+ZYmlc8kNFaPrS096dWDW++uMWe09K8rMpLNP6Nxp1E=";
      };
      substitutions = [
        {
          path = "external/sbgECom/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/argtable/argtable3.git";
          to = "URL ${sources."sbg_driver/argtable3"}";
        }
      ];
    };
    "sbg_driver/argtable3" = substituteSource {
      src = fetchgit {
        name = "argtable3-source";
        url = "https://github.com/argtable/argtable3.git";
        rev = "f25c624e3a5a65f4d1897aa7d51c897f8f8098d0";
        hash = "sha256-X89xFLDs6NEgjzzwy8kplvTgukQd/CV3Xa9A3JXecf4=";
      };
    };
  });
  meta = {
    description = "\n    ROS driver package for communication with the SBG navigation systems.\n  ";
  };
})
