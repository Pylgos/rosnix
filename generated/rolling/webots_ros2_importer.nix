{
  ament_copyright,
  buildPackages,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    webots_ros2_importer = substituteSource {
      src = fetchgit {
        name = "webots_ros2_importer-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "01b3ce07bc8aebfa3c652bdce6277e0a8aa8a453";
        hash = "sha256-0BjkWBfT9UijOpEXMxJlQSl5ecFhKxV3II4hqj3MLsY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_importer";
  version = "2023.1.3-1";
  src = sources.webots_ros2_importer;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.lark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces python3Packages.pycollada xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.numpy python3Packages.pillow python3Packages.pycodestyle python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "This package allows to convert URDF and XACRO files into Webots PROTO files.";
  };
}
