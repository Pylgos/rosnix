{
  ament_cmake,
  ament_lint_auto,
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
    topic_tools_interfaces-c91a339994dee30bae25a5321f58df6a8f032848 = substituteSource {
      src = fetchgit {
        name = "topic_tools_interfaces-c91a339994dee30bae25a5321f58df6a8f032848-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "c91a339994dee30bae25a5321f58df6a8f032848";
        hash = "sha256-zoT3Ek1jCnSoqP0Eu/s7glNQOcMXcQNTnzdBAPM+2/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools_interfaces";
  version = "1.4.0-1";
  src = sources.topic_tools_interfaces-c91a339994dee30bae25a5321f58df6a8f032848;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
}
