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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sbg_driver";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."sbg_driver";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs nmea-msgs rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "sbg_driver" = substituteSource {
      src = fetchgit {
        name = "sbg_driver-source";
        url = "https://github.com/SBG-Systems/sbg_ros2-release.git";
        rev = "1ad1983cd85fcbe27bcf446d77e011893f14375e";
        hash = "sha256-GHyXpEEfJVzYTOnNHGXHSOaKObjTHQL2WEtiHh74hnM=";
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
        rev = "1c1bb23b305c8cf349328fc0cacd7beb7a575ff4";
        hash = "sha256-sL6mnxsuL1K0DY26jLF/2Czo0RxHYJ3xU3VyavISiMM=";
      };
    };
  });
  meta = {
    description = "ROS driver package for communication with the SBG navigation systems.";
  };
})
