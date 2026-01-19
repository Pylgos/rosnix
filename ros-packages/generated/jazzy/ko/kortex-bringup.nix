{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gripper-controllers,
  joint-state-broadcaster,
  joint-state-publisher,
  joint-trajectory-controller,
  kortex-description,
  kortex-driver,
  launch,
  launch-ros,
  mkSourceSet,
  rclpy,
  robotiq-description,
  ros-gz-bridge,
  ros-gz-sim,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_bringup";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."kortex_bringup";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager gripper-controllers joint-state-broadcaster joint-state-publisher joint-trajectory-controller kortex-description kortex-driver launch launch-ros rclpy robotiq-description ros-gz-bridge ros-gz-sim rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ controller-manager gripper-controllers joint-state-broadcaster joint-state-publisher joint-trajectory-controller kortex-description kortex-driver launch launch-ros rclpy robotiq-description ros-gz-bridge ros-gz-sim rviz2 urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_bringup" = substituteSource {
      src = fetchgit {
        name = "kortex_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "476c6175b72751dee1b00bb8c9da82bfb4a6ddc7";
        hash = "sha256-W3XVPogtWJSESxzDgoF4+gKFXZeDO/25tsE30GIE3X0=";
      };
    };
  });
  meta = {
    description = "Launch file and run-time configurations, e.g. controllers.";
  };
})
