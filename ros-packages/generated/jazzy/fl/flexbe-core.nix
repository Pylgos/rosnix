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
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_core";
  propagatedBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-ros launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "flexbe_core" = substituteSource {
        src = fetchgit {
          name = "flexbe_core-source";
          url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
          rev = "237e2098a1e767209cf6aa0806947e9d68ae024c";
          hash = "sha256-H4Wrtmbl6nwhcBJBbA+XtOkHJnDhvtGLfec0Qz0K99g=";
        };
      };
    });
  };
  meta = {
    description = "flexbe_core provides the core components for the FlexBE behavior engine.";
  };
})
