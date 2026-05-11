{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_executors";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_executors";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_executors" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_executors-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "8191c7d45040302b8bfdcfb14f9736c65ef03062";
        hash = "sha256-/J/QUY5WR+ZxyYm1ek42NX/LvKW7THlX46shfedKM5s=";
      };
    };
  });
  meta = {
    description = "Examples of creating and using exectors to run multiple nodes in the same process";
  };
})
