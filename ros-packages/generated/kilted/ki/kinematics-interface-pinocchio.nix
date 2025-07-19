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
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface_pinocchio";
  version = "0.0.1-2";
  src = finalAttrs.passthru.sources."kinematics_interface_pinocchio";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module kinematics-interface pinocchio pluginlib ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module kinematics-interface pinocchio pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface_pinocchio" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_pinocchio-source";
        url = "https://github.com/ros2-gbp/kinematics_interface_pinocchio-release.git";
        rev = "dfc69121f6892d9e06c3d5f45d15d73312946f18";
        hash = "sha256-ZKQkvTN36XMGB70AZ7T1heqCBSskHz39cq6Po16OkgA=";
      };
    };
  });
  meta = {
    description = "Pinocchio-based implementation of ros2_control kinematics interface";
  };
})
