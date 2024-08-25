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
        rev = "7660946e3fdcaa4bc82fb2749810ea5351459c29";
        hash = "sha256-DmEwJUW5s0CWgLCobzk8jZHAJT0hfGm41Uy6Djg/3Sg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quality_of_service_demo_py";
  version = "0.33.4-1";
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
