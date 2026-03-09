{
  ament-cmake-gtest,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-core,
  pluginlib,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crx_kinematics";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."crx_kinematics";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-core pluginlib tf2-eigen ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ moveit-core pluginlib tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "crx_kinematics" = substituteSource {
      src = fetchgit {
        name = "crx_kinematics-source";
        url = "https://github.com/ros2-gbp/crx_kinematics-release.git";
        rev = "e6e8d95f099c03f104b57e89a73b4df23f026bea";
        hash = "sha256-V0sh6HONn07kNY9YdO9v0Wl9kTSwd5ilcJRRI37n6gw=";
      };
    };
  });
  meta = {
    description = "C++ implementation of FK/IK for Fanuc CRX series cobots";
  };
})
