{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2_controllers_test_nodes";
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers_test_nodes";
  propagatedBuildInputs = [ rclpy std-msgs trajectory-msgs ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers_test_nodes" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "4ea04061844a6eb9fb547d11c7a221f1acf04bab";
        hash = "sha256-gr2lvgk69yHRVD6/3tVItx1pz8Z3TcAqo0z+6hgN0Tw=";
      };
    };
  });
  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
  };
})
