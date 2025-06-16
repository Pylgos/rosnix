{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  moveit-resources-fanuc-description,
  position-controllers,
  robot-state-publisher,
  ros2cli-common-extensions,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_fanuc_moveit_config";
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."moveit_resources_fanuc_moveit_config";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-publisher moveit-resources-fanuc-description position-controllers robot-state-publisher ros2cli-common-extensions tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager joint-state-publisher moveit-resources-fanuc-description position-controllers robot-state-publisher ros2cli-common-extensions tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "61fea1e6b7bef8fc1107f1a1ed172db832f64dde";
        hash = "sha256-+nbLIYRD05c2SMiib5jkXpDQeVB19vn/UZ8wwmUnkFk=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
