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
  version = "3.3.0-1";
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
        rev = "241f17efb4bcaabf4b89605e70f2877505513a4b";
        hash = "sha256-0+xg1x/hze3yQ906OT0uV3JbaTaevv4YLHh0Z0w1hQ0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/SBG-Systems/sbgECom.git";
          to = "URL ${sources."sbg_driver/sbgECom"}";
        }
      ];
    };
    "sbg_driver/sbgECom" = substituteSource {
      src = fetchgit {
        name = "sbgECom-source";
        url = "https://github.com/SBG-Systems/sbgECom.git";
        rev = "05c19cdd7c021a8474b2bffc8ca4ec274f6a9155";
        hash = "sha256-5tWG33XX5S+8mRXF5whsS0qvJ2sCizPzzQ03J/FUp4w=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/argtable/argtable3.git";
          to = "URL ${sources."sbg_driver/sbgECom/argtable3"}";
        }
      ];
    };
    "sbg_driver/sbgECom/argtable3" = substituteSource {
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
