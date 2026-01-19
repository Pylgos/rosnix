{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  kinematics-interface,
  mkSourceSet,
  pinocchio,
  pluginlib,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface_pinocchio";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."kinematics_interface_pinocchio";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module kinematics-interface pinocchio pluginlib ros2-control-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module kinematics-interface pinocchio pluginlib ros2-control-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface_pinocchio" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_pinocchio-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "c314c8649864076b3aaf71ab30d3c53514f8213d";
        hash = "sha256-iGRoCiH1xDtpYAhk/JZmj8ur7CDsy4zK77PKfl2nP+E=";
      };
    };
  });
  meta = {
    description = "Pinocchio-based implementation of ros2_control kinematics interface";
  };
})
