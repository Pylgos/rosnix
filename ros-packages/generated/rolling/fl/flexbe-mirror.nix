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
  version = "4.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_mirror";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_mirror" = substituteSource {
      src = fetchgit {
        name = "flexbe_mirror-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "433fe8fdeb2ad6115c0494753165efe13a1c0525";
        hash = "sha256-Pdz73H2OzYdASAsxJbPaMOR3zBYyrwUFjKwLa58/QJU=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_mirror implements functionality to remotely mirror an executed behavior.\n    ";
  };
})
