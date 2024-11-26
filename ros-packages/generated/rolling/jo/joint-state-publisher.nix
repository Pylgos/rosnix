{
  ament-copyright,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2topic,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "joint_state_publisher";
  version = "2.4.0-2";
  src = finalAttrs.passthru.sources."joint_state_publisher";
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs ];
  checkInputs = [ ament-copyright ament-xmllint launch-testing launch-testing-ros ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "joint_state_publisher" = substituteSource {
        src = fetchgit {
          name = "joint_state_publisher-source";
          url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
          rev = "95191ef225b7c3c295aea1921f32752c95f58d19";
          hash = "sha256-Nw7THKbjIvXASwE8//Ta0Z1Q5BPXlK5VafC2jZvMs4E=";
        };
      };
    });
  };
  meta = {
    description = "This package contains a tool for setting and publishing joint state values for a given URDF.";
  };
})
