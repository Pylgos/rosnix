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
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
  tf2-eigen-kdl,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface_kdl";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."kinematics_interface_kdl";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = [ kdl-parser kinematics-interface pluginlib tf2-eigen-kdl ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface_kdl" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_kdl-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "f4c1a5e5f5f1fbdfb892f804b82ec818717e2eb1";
        hash = "sha256-fJDKQHc4jjucO7S75tFYWhJNJhnvSR5M9aiyJKZcez4=";
      };
    };
  });
  meta = {
    description = "KDL implementation of ros2_control kinematics interface";
  };
})
