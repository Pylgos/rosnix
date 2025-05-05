{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "joint_state_publisher_gui";
  version = "2.4.0-2";
  src = finalAttrs.passthru.sources."joint_state_publisher_gui";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher python-qt-binding rclpy ];
  propagatedBuildInputs = [ joint-state-publisher python-qt-binding rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "joint_state_publisher_gui" = substituteSource {
      src = fetchgit {
        name = "joint_state_publisher_gui-source";
        url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
        rev = "80338304f851c7b8190e8cb228a1196b8997b010";
        hash = "sha256-ZumKM1KrbYTFo3f4tigUBtyVcxNOVbG2+FR7x85ZLhM=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a GUI tool for setting and publishing joint state values for a given URDF.\n  ";
  };
})
