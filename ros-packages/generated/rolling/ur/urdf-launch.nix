{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  launch-ros,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz2,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf_launch";
  version = "0.1.2-2";
  src = finalAttrs.passthru.sources."urdf_launch";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui launch-ros robot-state-publisher rviz2 rviz-common rviz-default-plugins xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui launch-ros robot-state-publisher rviz2 rviz-common rviz-default-plugins xacro ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_launch" = substituteSource {
      src = fetchgit {
        name = "urdf_launch-source";
        url = "https://github.com/ros2-gbp/urdf_launch-release.git";
        rev = "46f7c0c25939218f1ea5347cf6d369b1a9213a72";
        hash = "sha256-uBoizHuTTlCPkWyaybnQiGWF87Py/o/NesmTyAzWQhQ=";
      };
    };
  });
  meta = {
    description = "Launch files for common URDF operations";
  };
})
