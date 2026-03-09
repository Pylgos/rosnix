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
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf_launch";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."urdf_launch";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui launch-ros robot-state-publisher rviz2 rviz-common rviz-default-plugins xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui launch-ros robot-state-publisher rviz2 rviz-common rviz-default-plugins xacro ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_launch" = substituteSource {
      src = fetchgit {
        name = "urdf_launch-source";
        url = "https://github.com/ros2-gbp/urdf_launch-release.git";
        rev = "06b23de269a8ba3cad4cd041880a2d5b7081e4bf";
        hash = "sha256-uBoizHuTTlCPkWyaybnQiGWF87Py/o/NesmTyAzWQhQ=";
      };
    };
  });
  meta = {
    description = "Launch files for common URDF operations";
  };
})
