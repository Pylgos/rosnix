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
    ecl_command_line = substituteSource {
      src = fetchgit {
        name = "ecl_command_line-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "d2b05a008d2f744adffa0468f4707c7690571de5";
        hash = "sha256-0rOoPXNkY6U26dMB39t2IjB44typZqO4T5rW2jrEOl8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_command_line";
  version = "1.2.1-4";
  src = sources.ecl_command_line;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Embeds the TCLAP library inside the ecl. This is a very convenient command line parser in templatised c++.";
  };
}
