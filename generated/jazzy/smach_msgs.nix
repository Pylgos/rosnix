{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_lint,
  buildRosPackage,
  builtin_interfaces,
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
    smach_msgs = substituteSource {
      src = fetchgit {
        name = "smach_msgs-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "e4906ce6c6e13e5c028b738e8f00b7b518a5d76e";
        hash = "sha256-GO/kVPGJMyEujXHxScev2o0WXzzzWX0rZHWTMJTPCwg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smach_msgs";
  version = "3.0.3-3";
  src = sources.smach_msgs;
  nativeBuildInputs = [ ament_cmake ament_cmake_cppcheck ament_cmake_flake8 ament_cmake_pep257 rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cpplint ament_cmake_uncrustify ament_lint ];
  missingDependencies = [  ];
  meta = {
    description = "this package contains a set of messages that are used by the introspection interfaces for smach.";
  };
}
