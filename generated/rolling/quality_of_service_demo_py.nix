{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    quality_of_service_demo_py = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "2d19048e7fea01533502a448e12b2801ec2031ac";
        hash = "sha256-/ILPhIdb/aWGo8jVJt5opa0uwVBQJv6Rp0YRE8RtkaA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quality_of_service_demo_py";
  version = "0.34.2-1";
  src = sources.quality_of_service_demo_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
}
