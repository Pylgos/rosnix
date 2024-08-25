{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  ecl_mpl,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_type_traits = substituteSource {
      src = fetchgit {
        name = "ecl_type_traits-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "47f98b37070d58a2022f16c62a2da0fab88c70dd";
        hash = "sha256-s8Qksqd5xzvMghgqo0aQ6r0Oyou3x5hgXLB5t3MvZVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_type_traits";
  version = "1.2.1-4";
  src = sources.ecl_type_traits;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ecl_mpl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Extends c++ type traits and implements a few more to boot.";
  };
}
