{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  composition-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_ros";
  version = "0.29.6-1";
  src = finalAttrs.passthru.sources."launch_ros";
  propagatedNativeBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-osrf-pycommon" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-osrf-pycommon" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_ros" = substituteSource {
      src = fetchgit {
        name = "launch_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "6078855cfb0b07f1e04ecc6ccc116568cd3880cf";
        hash = "sha256-AasLjbYCIYcVyp2k3YF6+Pn0bMkkyajhocCtv7IWlIQ=";
      };
    };
  });
  meta = {
    description = "ROS specific extensions to the launch tool.";
  };
})
