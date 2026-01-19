{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  bcr-arm-description,
  bcr-arm-gazebo,
  bcr-arm-moveit-config,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bcr_arm_ros2";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."bcr_arm_ros2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ bcr-arm-description bcr-arm-gazebo bcr-arm-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bcr-arm-description bcr-arm-gazebo bcr-arm-moveit-config ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm_ros2" = substituteSource {
      src = fetchgit {
        name = "bcr_arm_ros2-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "ecddb39ffafea6fb91e73c0c6ee0b6989173845f";
        hash = "sha256-THVLxjFl2T7d4O9WiOmMzz52cHsrl90a4tnA3T1trQI=";
      };
    };
  });
  meta = {
    description = "TODO: Package description (metapackage)";
  };
})
