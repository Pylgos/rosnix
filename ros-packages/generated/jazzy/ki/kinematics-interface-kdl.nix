{
  ament-cmake,
  ament-cmake-gmock,
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
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
  tf2-eigen-kdl,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface_kdl";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."kinematics_interface_kdl";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ kdl-parser kinematics-interface pluginlib ros2-control-cmake tf2-eigen-kdl ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ kdl-parser kinematics-interface pluginlib ros2-control-cmake tf2-eigen-kdl ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface_kdl" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_kdl-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "0a8a0b4ad5aa9717059fc4823654c255efda5efb";
        hash = "sha256-aI4r2fehJ2nBvtM0c40s/tkBs+dxHvOCV0fwedGEtAI=";
      };
    };
  });
  meta = {
    description = "KDL implementation of ros2_control kinematics interface";
  };
})
