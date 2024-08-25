{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_config = substituteSource {
      src = fetchgit {
        name = "ecl_config-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "239cbce5d68a90bf4402374d969e80bc29e9651b";
        hash = "sha256-eH0ytH9tso+gcYGQSXy83dIPeklxY5K+/Jo0cV9qAxI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_config";
  version = "1.2.0-4";
  src = sources.ecl_config;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "These tools inspect and describe your system with macros, types and functions.";
  };
}
