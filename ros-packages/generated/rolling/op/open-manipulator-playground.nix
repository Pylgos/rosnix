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
  version = "3.2.2-1";
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
        rev = "0f487dd3f9aa598d1c927c9bf399eba10ffc5121";
        hash = "sha256-WFyyerIqLyeXaQid1J3U43Peh0wqlMgR6CZJD5BIhxQ=";
      };
    };
  });
  meta = {
    description = "\n    This package provides an example for utilizing the MoveIt API with the OpenMANIPULATOR-X,\n    allowing users to practice and experiment freely.\n  ";
  };
})
