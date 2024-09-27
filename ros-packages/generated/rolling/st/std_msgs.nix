{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    std_msgs-6caa3d659eddf3f3520a563afd579207e7b0e060 = substituteSource {
      src = fetchgit {
        name = "std_msgs-6caa3d659eddf3f3520a563afd579207e7b0e060-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "6caa3d659eddf3f3520a563afd579207e7b0e060";
        hash = "sha256-ZlucnBjZl0ribV8kErdUu63DstFByzgVOh4X6GEJvCk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_msgs";
  version = "5.4.1-1";
  src = sources.std_msgs-6caa3d659eddf3f3520a563afd579207e7b0e060;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some standard message definitions.";
  };
}
