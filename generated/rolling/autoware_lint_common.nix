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
  substituteSource,
}:
let
  sources = rec {
    autoware_lint_common = substituteSource {
      src = fetchgit {
        name = "autoware_lint_common-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "bd9cf635bb1cc7f8d9fed68f017322e6f7d80a46";
        hash = "sha256-fS+Hicd3o8vyffKxyp4X3iosj9vznc4UJIbAH8Kp5BU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_lint_common";
  version = "1.0.0-1";
  src = sources.autoware_lint_common;
  nativeBuildInputs = [ ament_cmake_export_dependencies ];
  propagatedNativeBuildInputs = [ ament_cmake_copyright ament_cmake_core ament_cmake_cppcheck ament_cmake_lint_cmake ament_cmake_test ament_cmake_xmllint ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The list of commonly used linters in Autoware";
  };
}
