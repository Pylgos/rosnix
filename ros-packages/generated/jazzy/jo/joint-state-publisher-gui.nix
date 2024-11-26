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
  version = "2.4.0-3";
  src = finalAttrs.passthru.sources."joint_state_publisher_gui";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher python-qt-binding rclpy ];
  passthru = {
    sources = mkSourceSet (sources: {
      "joint_state_publisher_gui" = substituteSource {
        src = fetchgit {
          name = "joint_state_publisher_gui-source";
          url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
          rev = "21816fed55bedeedc28f78d7a028f6bc75729f01";
          hash = "sha256-ZumKM1KrbYTFo3f4tigUBtyVcxNOVbG2+FR7x85ZLhM=";
        };
      };
    });
  };
  meta = {
    description = "This package contains a GUI tool for setting and publishing joint state values for a given URDF.";
  };
})
