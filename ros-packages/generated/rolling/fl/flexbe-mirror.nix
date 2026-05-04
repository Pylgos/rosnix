{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_mirror";
  version = "4.0.3-2";
  src = finalAttrs.passthru.sources."flexbe_mirror";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_mirror" = substituteSource {
      src = fetchgit {
        name = "flexbe_mirror-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "4433ee0f1cd93369ba1762e9be7eccfe3898e58b";
        hash = "sha256-Pdz73H2OzYdASAsxJbPaMOR3zBYyrwUFjKwLa58/QJU=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_mirror implements functionality to remotely mirror an executed behavior.\n    ";
  };
})
