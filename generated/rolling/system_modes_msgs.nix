{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    system_modes_msgs = substituteSource {
      src = fetchgit {
        name = "system_modes_msgs-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "54ca985a62ba5234ccc4578a795f722e79168f9d";
        hash = "sha256-UcVnvMWo1lcz8PljlXg4m53YoUKsphq4TbfgB7Z3dgw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "system_modes_msgs";
  version = "0.9.0-5";
  src = sources.system_modes_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Interface package, containing message definitions and service definitions for the system modes package.";
  };
}
