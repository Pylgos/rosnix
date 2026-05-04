{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-msgs,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_core";
  version = "4.0.3-2";
  src = finalAttrs.passthru.sources."flexbe_core";
  propagatedNativeBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  propagatedBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-ros launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_core" = substituteSource {
      src = fetchgit {
        name = "flexbe_core-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "f704427ecad3a01ed9632f33778a4ff552793ccc";
        hash = "sha256-AjprZkH3YqC6t7vL/ZN8TVwTqkOWRmBOoU+b5/dumNY=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_core provides the core components for the FlexBE behavior engine.\n    ";
  };
})
