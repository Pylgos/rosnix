{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_babel_fish_test_msgs-80081d37d9e05574851208b312f2e09b87783fec = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish_test_msgs-80081d37d9e05574851208b312f2e09b87783fec-source";
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
  src = sources.ros_babel_fish_test_msgs-80081d37d9e05574851208b312f2e09b87783fec;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Test messages for the ros_babel_fish project tests.";
  };
}
