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
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_bringup";
  version = "0.2.2-2";
  src = finalAttrs.passthru.sources."kortex_bringup";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager gripper-controllers joint-state-broadcaster joint-state-publisher joint-trajectory-controller kortex-description kortex-driver launch launch-ros rclpy robotiq-description rviz2 urdf xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gazebo_ros2_control" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ controller-manager gripper-controllers joint-state-broadcaster joint-state-publisher joint-trajectory-controller kortex-description kortex-driver launch launch-ros rclpy robotiq-description rviz2 urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_ros2_control" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kortex_bringup" = substituteSource {
      src = fetchgit {
        name = "kortex_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "7b1b9e5b58add56d94b77593684e748c7b8b68d0";
        hash = "sha256-IQ2mPpCxvX2VcdeA/0EEI0NE3gUueLUjdVkn5RlveZs=";
      };
    };
  });
  meta = {
    description = "Launch file and run-time configurations, e.g. controllers.";
  };
})
