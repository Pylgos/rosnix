{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flir-ptu-description,
  flir-ptu-driver,
  interactive-markers,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  rclpy,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  sensor-msgs,
  substituteSource,
  visualization-msgs,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flir_ptu_viz";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."flir_ptu_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ flir-ptu-description flir-ptu-driver interactive-markers joint-state-publisher joint-state-publisher-gui rclpy robot-state-publisher rviz2 sensor-msgs visualization-msgs xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ flir-ptu-description flir-ptu-driver interactive-markers joint-state-publisher joint-state-publisher-gui rclpy robot-state-publisher rviz2 sensor-msgs visualization-msgs xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flir_ptu_viz" = substituteSource {
      src = fetchgit {
        name = "flir_ptu_viz-source";
        url = "https://github.com/ros-drivers-gbp/flir_ptu-release.git";
        rev = "70d8b94f51004746bd4d3d5d63ebccc9ea465b0b";
        hash = "sha256-xClsYbO6IjHeibBQA8JoiRVn3z3+lwuXpkRLc1mpUo0=";
      };
    };
  });
  meta = {
    description = "Launch files and RViz configs to assist with visualizing the FLIR PTUs.";
  };
})
