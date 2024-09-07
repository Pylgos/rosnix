{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_pycommon = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "52cb2514bde8ec8e606415c200f80e21ec8b391f";
        hash = "sha256-HwtksPYLXC/1Md1Fnyo0Ofiui7YhfDehVHn6SqcKSGM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_pycommon";
  version = "4.6.4-1";
  src = sources.rosidl_pycommon;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
}
