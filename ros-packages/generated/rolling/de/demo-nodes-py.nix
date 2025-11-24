{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "demo_nodes_py";
  version = "0.37.4-1";
  src = finalAttrs.passthru.sources."demo_nodes_py";
  propagatedNativeBuildInputs = [ ament-index-python example-interfaces rcl-interfaces rclpy std-msgs ];
  propagatedBuildInputs = [ ament-index-python example-interfaces rcl-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "demo_nodes_py" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "08c43e2c9ab74c0463a168ba54dd341df38e0239";
        hash = "sha256-nOMgBpUrh86Me2QhDYJWQhmQOiQgx6/cgrqzcuXPwFY=";
      };
    };
  });
  meta = {
    description = "\n    Python nodes which were previously in the ros2/examples repository but are now just used for demo purposes.\n  ";
  };
})
