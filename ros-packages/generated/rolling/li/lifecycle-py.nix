{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "lifecycle_py";
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."lifecycle_py";
  propagatedBuildInputs = [ lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint lifecycle ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_py" = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "58c371a2069fd6aa36782003c974e75c9b077177";
        hash = "sha256-mpM2qC2joW3fmgf0ze0mZEQTT1Ez+CKmEuEeNfqr+Dk=";
      };
    };
  });
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
})
