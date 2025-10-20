{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  joint-state-publisher,
  launch,
  launch-ros,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  ros-gz-bridge,
  ros-gz-sim,
  rosSystemPackages,
  rviz2,
  substituteSource,
  ur-controllers,
  ur-description,
  ur-moveit-config,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_simulation_gz";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."ur_simulation_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-ros2-control joint-state-publisher launch launch-ros ros-gz-bridge ros-gz-sim rviz2 ur-controllers ur-description ur-moveit-config urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-ros2-control joint-state-publisher launch launch-ros ros-gz-bridge ros-gz-sim rviz2 ur-controllers ur-description ur-moveit-config urdf xacro ];
  checkInputs = [ ament-cmake-pytest launch-testing-ament-cmake launch-testing-ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ur_simulation_gz" = substituteSource {
      src = fetchgit {
        name = "ur_simulation_gz-source";
        url = "https://github.com/ros2-gbp/ur_simulation_gz-release.git";
        rev = "d56de8c4f175b1628215be11d49b34b3d8e660f3";
        hash = "sha256-86YkampGigarMyGIOFDpfmMPi5XBUT3umQGsrJiFCWs=";
      };
    };
  });
  meta = {
    description = "Example and configuration files for Gazebo simulation of UR manipulators.";
  };
})
