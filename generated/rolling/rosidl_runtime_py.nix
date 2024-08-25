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
        rev = "51c5352a777f1a15d85273ded90d0133daf9be29";
        hash = "sha256-p8FDKIm1mdJdb91wwQ4jtJRlgYxNdaaXHgTZtuwpIlE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_py";
  version = "0.14.0-1";
  src = sources.rosidl_runtime_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.numpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest std_msgs std_srvs test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Runtime utilities for working with generated ROS interfaces in Python.";
  };
}
