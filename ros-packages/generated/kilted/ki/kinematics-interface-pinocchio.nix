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
  version = "2.4.0-1";
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
        rev = "c339fb4a225ab2ee7ce6faec4fbdba00213d56e8";
        hash = "sha256-tjCZpsE8fVcnvfiykbMO7Z3ONZ9qgUphyLcFOM1wIUU=";
      };
    };
  });
  meta = {
    description = "Pinocchio-based implementation of ros2_control kinematics interface";
  };
})
