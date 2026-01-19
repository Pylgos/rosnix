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
  version = "4.1.2-1";
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
        rev = "d4431370f5faaed516d12a71d096f08210d631a6";
        hash = "sha256-ToLYgJxfprYxfqnTKqBer2ByDgItc8ziTfFSM7dxo0o=";
      };
    };
  });
  meta = {
    description = "\n    This package provides an example for utilizing the MoveIt API with the OpenMANIPULATOR,\n    allowing users to practice and experiment freely.\n  ";
  };
})
