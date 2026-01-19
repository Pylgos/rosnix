{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  joint-state-publisher,
  joint-trajectory-controller,
  kortex-description,
  kortex-driver,
  launch,
  launch-ros,
  mkSourceSet,
  parallel-gripper-controller,
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
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."kortex_bringup";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-broadcaster joint-state-publisher joint-trajectory-controller kortex-description kortex-driver launch launch-ros parallel-gripper-controller rclpy robotiq-description ros-gz-bridge ros-gz-sim rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ controller-manager joint-state-broadcaster joint-state-publisher joint-trajectory-controller kortex-description kortex-driver launch launch-ros parallel-gripper-controller rclpy robotiq-description ros-gz-bridge ros-gz-sim rviz2 urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_bringup" = substituteSource {
      src = fetchgit {
        name = "kortex_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "faef3fd25202d41394482374ab895de3ccdfc809";
        hash = "sha256-iuAvfN791pqzdEHjas+z3mofnjIEqsEysgLuLvv6T7o=";
      };
    };
  });
  meta = {
    description = "Launch file and run-time configurations, e.g. controllers.";
  };
})
