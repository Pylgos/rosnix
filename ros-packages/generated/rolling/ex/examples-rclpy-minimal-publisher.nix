{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "fff20d168e2568a020fe516e5c7c69f9b8190fc5";
        hash = "sha256-6/jdqtssg27v92BzFjsdH6SaE34Acu78BbuiSpVTAhM=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_publisher";
  version = "0.20.2-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_publisher";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
})
