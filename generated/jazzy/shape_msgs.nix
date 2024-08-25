{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    shape_msgs = substituteSource {
      src = fetchgit {
        name = "shape_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "79f7106056e38493dc72b9ab32567657a1b2bead";
        hash = "sha256-rs1GqK5oBr04xDLis20P/Ym2CrxVsS+UgNrnVCMDKb0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "shape_msgs";
  version = "5.3.5-1";
  src = sources.shape_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some message definitions which describe geometric shapes.";
  };
}
