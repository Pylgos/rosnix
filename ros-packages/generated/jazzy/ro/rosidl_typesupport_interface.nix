{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_interface-5bf5a0d16d6cf1a47dc5f952a2f62854e8195582 = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-5bf5a0d16d6cf1a47dc5f952a2f62854e8195582-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "5bf5a0d16d6cf1a47dc5f952a2f62854e8195582";
        hash = "sha256-kQxdJ7mirw4WofaEfh4lS6avIwbWrWHSd4YUk3DxWOo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_interface";
  version = "4.6.4-1";
  src = sources.rosidl_typesupport_interface-5bf5a0d16d6cf1a47dc5f952a2f62854e8195582;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The interface for rosidl typesupport packages.";
  };
}
