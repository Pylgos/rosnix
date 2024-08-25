{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcgcd_spl_14,
  rcgcd_spl_14_conversion,
  rcgcrd_spl_4,
  rcgcrd_spl_4_conversion,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    gc_spl_2022 = substituteSource {
      src = fetchgit {
        name = "gc_spl_2022-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "614c89da758766a75b5428d8572d113dab487143";
        hash = "sha256-TfjfnmIcrHDLljR0mc7TbRI7pB8FeP3JFv1Jf6C9zpM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl_2022";
  version = "4.0.1-1";
  src = sources.gc_spl_2022;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcgcd_spl_14 rcgcd_spl_14_conversion rcgcrd_spl_4 rcgcrd_spl_4_conversion rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "GameController-Robot communication in RoboCup SPL at RoboCup2022";
  };
}
