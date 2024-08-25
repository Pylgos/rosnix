{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_parser,
  std_msgs,
  std_srvs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosidl_runtime_py = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_py-source";
        url = "https://github.com/ros2-gbp/rosidl_runtime_py-release.git";
        rev = "0b05e57c72fb835489f909e39d6868e234957a7a";
        hash = "sha256-jytdOfWquw/4LfZWrw4Y5ENdwCIZr54jgWE40LjBpbU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_py";
  version = "0.13.1-2";
  src = sources.rosidl_runtime_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy buildPackages.python3Packages.pyyaml rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest std_msgs std_srvs test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Runtime utilities for working with generated ROS interfaces in Python.";
  };
}
