{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  demo-nodes-cpp,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2bag,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "launch_testing_examples" = substituteSource {
      src = fetchgit {
        name = "launch_testing_examples-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "e108dbcd077d21661317d3f2aec1bbc1ce82719f";
        hash = "sha256-Kw/HBLjTaLj+zjxaMJ/3mItcr9/VgqQIp0U7ibvwrck=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "launch_testing_examples";
  version = "0.20.2-1";
  src = sources."launch_testing_examples";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ demo-nodes-cpp launch launch-ros launch-testing launch-testing-ros rcl-interfaces rclpy ros2bag std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Examples of simple launch tests";
  };
}
