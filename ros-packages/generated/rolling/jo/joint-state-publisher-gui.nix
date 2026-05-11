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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "joint_state_publisher_gui";
  version = "2.4.2-1";
  src = finalAttrs.passthru.sources."joint_state_publisher_gui";
  propagatedNativeBuildInputs = [ joint-state-publisher python-qt-binding rclpy ];
  propagatedBuildInputs = [ joint-state-publisher python-qt-binding rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "joint_state_publisher_gui" = substituteSource {
      src = fetchgit {
        name = "joint_state_publisher_gui-source";
        url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
        rev = "69e657d95f3975aa82610411ff59ee4da049da95";
        hash = "sha256-P4P5mC6VAhjGvZDxNxNrMMkiMswvD17W4B1waOitWjw=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a GUI tool for setting and publishing joint state values for a given URDF.\n  ";
  };
})
