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
  version = "2.4.1-2";
  src = finalAttrs.passthru.sources."joint_state_publisher_gui";
  propagatedNativeBuildInputs = [ joint-state-publisher python-qt-binding rclpy ];
  propagatedBuildInputs = [ joint-state-publisher python-qt-binding rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "joint_state_publisher_gui" = substituteSource {
      src = fetchgit {
        name = "joint_state_publisher_gui-source";
        url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
        rev = "0a919e90f7ace1ea91dafc1f6ab122b8d45f5482";
        hash = "sha256-S9408FbFM2Q829i6klFJq1C1KKKAWNbIsf5Btl3kbjI=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a GUI tool for setting and publishing joint state values for a given URDF.\n  ";
  };
})
