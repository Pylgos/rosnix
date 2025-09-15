{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-ros-planning-interface,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_playground";
  version = "4.0.8-1";
  src = finalAttrs.passthru.sources."open_manipulator_playground";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-ros-planning-interface rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-ros-planning-interface rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_playground" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_playground-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "0ea74f913901b1c8d019d27ad728c93b9be7de03";
        hash = "sha256-6gEp5WrfaEoucrGJX9kWHj0iQO6/sNYpIpgDvMd9w8U=";
      };
    };
  });
  meta = {
    description = "\n    This package provides an example for utilizing the MoveIt API with the OpenMANIPULATOR,\n    allowing users to practice and experiment freely.\n  ";
  };
})
