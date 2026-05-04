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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "demo_nodes_py";
  version = "0.37.8-2";
  src = finalAttrs.passthru.sources."demo_nodes_py";
  propagatedNativeBuildInputs = [ ament-index-python example-interfaces rcl-interfaces rclpy ];
  propagatedBuildInputs = [ ament-index-python example-interfaces rcl-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "demo_nodes_py" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "0922098cd747514f7038b65e20639c930d0f3595";
        hash = "sha256-cKrjGR40SQFEwcQLtl19LhcpxOG8DirpgmxyIWoI4gM=";
      };
    };
  });
  meta = {
    description = "\n    Python nodes which were previously in the ros2/examples repository but are now just used for demo purposes.\n  ";
  };
})
