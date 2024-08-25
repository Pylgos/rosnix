{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    twist_stamper = substituteSource {
      src = fetchgit {
        name = "twist_stamper-source";
        url = "https://github.com/ros2-gbp/twist_stamper-release.git";
        rev = "55f1d527940dafdcdd83c1e2f4a7165f086262b5";
        hash = "sha256-AE3PKMNhcFfc7nbMllXSYBoKhQmRVHLCirRpDAEknEQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "twist_stamper";
  version = "0.0.3-3";
  src = sources.twist_stamper;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 package for converting between Twist and TwistStamped messages";
  };
}
