{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  ros-testing,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "lifecycle_py";
  version = "0.37.8-2";
  src = finalAttrs.passthru.sources."lifecycle_py";
  propagatedNativeBuildInputs = [ example-interfaces lifecycle-msgs rclpy ];
  propagatedBuildInputs = [ example-interfaces lifecycle-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint lifecycle ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_py" = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "0ebc60fd485f5ad05f3987d58c59d70381b2862d";
        hash = "sha256-1RCNw7pKKuWZczldnFKn65VuDtl2LezJKODlONLLb6E=";
      };
    };
  });
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
})
