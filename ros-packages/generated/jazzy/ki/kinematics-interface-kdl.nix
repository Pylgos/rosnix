{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  kdl-parser,
  kinematics-interface,
  mkSourceSet,
  pluginlib,
  ros2-control-cmake,
  rosSystemPackages,
  substituteSource,
  tf2-eigen-kdl,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface_kdl";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."kinematics_interface_kdl";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ backward-ros kdl-parser kinematics-interface pluginlib ros2-control-cmake tf2-eigen-kdl ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ backward-ros kdl-parser kinematics-interface pluginlib ros2-control-cmake tf2-eigen-kdl ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface_kdl" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_kdl-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "258360e1ebacf0245789adbcb758d55f206f1428";
        hash = "sha256-lH03PrDo+Y5TTEGF34uHa5zUrXgYpv0AOAEWG3c3IeU=";
      };
    };
  });
  meta = {
    description = "KDL implementation of ros2_control kinematics interface";
  };
})
