{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_babel_fish_test_msgs = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish_test_msgs-source";
        url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
        rev = "80081d37d9e05574851208b312f2e09b87783fec";
        hash = "sha256-Mcs37Zkv5q3BkOmP+EdSpGCztN9T1CAU+WlS+pIFoNI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_babel_fish_test_msgs";
  version = "0.9.3-1";
  src = sources.ros_babel_fish_test_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Test messages for the ros_babel_fish project tests.";
  };
}
