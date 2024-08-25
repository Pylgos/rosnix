{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  rosbag2_py,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_py = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "e542dd9512cdf0ae010755d0b12c74725ab1cb79";
        hash = "sha256-j8OOPQ8nAcVB/1QGB6wVNXITGZ9lI+yt77Ce/DbB68Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_examples_py";
  version = "0.26.4-1";
  src = sources.rosbag2_examples_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclpy rosbag2_py std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python bag writing tutorial";
  };
}
