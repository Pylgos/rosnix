{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    quality_of_service_demo_py-2d19048e7fea01533502a448e12b2801ec2031ac = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_py-2d19048e7fea01533502a448e12b2801ec2031ac-source";
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
  src = sources.quality_of_service_demo_py-2d19048e7fea01533502a448e12b2801ec2031ac;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
}
