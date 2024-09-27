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
    rosidl_typesupport_interface-b7d64e4dc83b945903b1a08552a429344c54151d = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-b7d64e4dc83b945903b1a08552a429344c54151d-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "b7d64e4dc83b945903b1a08552a429344c54151d";
        hash = "sha256-a/qg98Z8Gp/dSbyJp13gzh14N4zh4pzrM8LsUQ0h4Sw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_interface";
  version = "4.8.1-1";
  src = sources.rosidl_typesupport_interface-b7d64e4dc83b945903b1a08552a429344c54151d;
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
