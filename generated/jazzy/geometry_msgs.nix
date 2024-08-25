{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    geometry_msgs = substituteSource {
      src = fetchgit {
        name = "geometry_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "9b595e5a5c793cc02c430a4fcc8c4cda4eef3725";
        hash = "sha256-tnsz8Gchh0hrKtLOTi//KLdKxmJrnhMGrJRz1PbBvxw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_msgs";
  version = "5.3.5-1";
  src = sources.geometry_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some geometry related message definitions.";
  };
}
