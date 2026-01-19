{
  ament-cmake,
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
  pname = "bcr_arm";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."bcr_arm";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ bcr-arm-description bcr-arm-gazebo bcr-arm-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bcr-arm-description bcr-arm-gazebo bcr-arm-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm" = substituteSource {
      src = fetchgit {
        name = "bcr_arm-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "93c0647b1dd8a9a5fefad09970be4e4cbfcc4bde";
        hash = "sha256-McMVY2o1ELSv2kiGP2GomA4dfBLDkD86FmtNni4MIaI=";
      };
    };
  });
  meta = {
    description = "Metapackage for the BCR Arm robot stack";
  };
})
