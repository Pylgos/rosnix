{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_cppcheck,
  ament_cmake_export_dependencies,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_lint_common" = substituteSource {
      src = fetchgit {
        name = "autoware_lint_common-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "18799aeb6914ff30a282d4d668329f5a20c18ead";
        hash = "sha256-fS+Hicd3o8vyffKxyp4X3iosj9vznc4UJIbAH8Kp5BU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_lint_common";
  version = "1.0.0-1";
  src = sources."autoware_lint_common";
  nativeBuildInputs = [ ament_cmake_export_dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_copyright ament_cmake_core ament_cmake_cppcheck ament_cmake_lint_cmake ament_cmake_test ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The list of commonly used linters in Autoware";
  };
}